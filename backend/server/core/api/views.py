import os
from datetime import date
from rest_framework.decorators import api_view
from rest_framework import serializers
import yookassa
from decouple import config
from yookassa import Configuration, Payment
from django_countries import countries
from django.db.models import Q
from django.conf import settings
from django.core.exceptions import ObjectDoesNotExist
from django.http import Http404
from django.http import HttpResponse, HttpResponseNotFound
from django.views import View
from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from rest_framework.generics import (ListAPIView, RetrieveAPIView,
                                     CreateAPIView, UpdateAPIView,
                                     DestroyAPIView)
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST
from .serializers import (ItemSerializer, OrderSerializer,
                          ItemDetailSerializer, AddressSerializer,
                          PayingSerializer, CarouselSerializer, CategoryDeatilSerializer, CategorySerializer)
from core.models import (Item, OrderItem, Order, Address, Paying, Coupon,
                         Refund, UserProfile, Variation, ItemVariation, Carousel, Category)
from rest_framework import generics
from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page
from django.views.decorators.vary import vary_on_cookie
from rest_framework.pagination import PageNumberPagination

Configuration.account_id = config("YOOKASSA_ACCOUNT_ID")
Configuration.secret_key = config("YOOKASSA_SECRET_KEY")


class UserIDView(APIView):

    def get(self, request, *args, **kwargs):
        return Response({'userID': request.user.id}, status=HTTP_200_OK)


# def infinite_filter(request):
#     limit = request.GET.get('limit')
#     offset = request.GET.get('offset')
#     return Item.objects.all().order_by(
#         'discount_price', '-pk')[int(offset):int(offset) + int(limit)]


# def is_there_more_data(request):
#     offset = request.GET.get('offset')
#     if int(offset) > Item.objects.all().count():
#         return False
#     return True


# class ItemListView(generics.ListAPIView):
#     permission_classes = (AllowAny, )
#     serializer_class = ItemSerializer

#     def get_queryset(self):
#         qs = infinite_filter(self.request)
#         return qs

#     #@method_decorator(cache_page(60 * 30))
#     #@method_decorator(vary_on_cookie)
#     def list(self, request):
#         queryset = self.get_queryset()
#         serializer = self.serializer_class(queryset, many=True)
#         return Response({
#             "data": serializer.data,
#             "has_more": is_there_more_data(request)
#         })

class StandardResultsSetPagination(PageNumberPagination):
    page_size = 10
    page_size_query_param = 'page_size'
    max_page_size = 1000


class Sitemap(ListAPIView):
    serializer_class = ItemSerializer
    queryset = Item.objects.all()


class CarouselListView(ListAPIView):
    permission_classes = (AllowAny,)
    serializer_class = CarouselSerializer
    queryset = Carousel.objects.all()


class ItemListView(ListAPIView):
    permission_classes = (AllowAny,)
    serializer_class = ItemSerializer
    pagination_class = StandardResultsSetPagination
    queryset = Item.objects.all()

    # @method_decorator(cache_page(60 * 30))
    # @method_decorator(vary_on_cookie)
    def list(self, request, slug=None):
        queryset = Item.objects.all().order_by('discount_price', '-pk')
        page = self.paginate_queryset(queryset)

        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)


class CategoryList(ListAPIView):
    permission_classes = (AllowAny,)
    serializer_class = CategorySerializer
    queryset = Category.objects.all()


class CategoryListDeatil(ListAPIView):
    permission_classes = (AllowAny,)
    pagination_class = StandardResultsSetPagination
    serializer_class = CategoryDeatilSerializer
    queryset = Category.objects.all()
    lookup_field = 'slug'

    def list(self, request, slug=None):
        slug = self.kwargs['slug']
        queryset = Category.objects.filter(slug=slug)

        serializer = self.get_serializer(queryset, many=True)
        meta_title = serializer.data[0]['name']
        meta_seo_description = serializer.data[0]['seo_description']
        return Response({
            "data": serializer.data[0]['item'],
            "meta": {"meta_title": meta_title, "meta_seo_description": meta_seo_description}

        })


class PaymentView(APIView):

    def post(self, request, *args, **kwargs):
        order = Order.objects.get(user=self.request.user, ordered=False)
        userprofile = UserProfile.objects.get(user=self.request.user)
        delivery = request.data.get('delivery')
        formdata = request.data.get('formData')
        get_delivery = "Доставка"
        get_pickup = "Самовывоз"
        amount = int(order.get_total() * 1)

        if delivery == get_delivery:
            shipping_address_id = request.data.get('selected')
            shipping_address = Address.objects.get(id=shipping_address_id)
            order.shipping_address = shipping_address
            order.save()
        else:
            order.save()

        if delivery == get_pickup:
            amount = amount
        if delivery == get_delivery:
            amount = amount + 450
        if amount >= 7000:
            amount = amount

        payment = Payment.create({
            "amount": {
                'value': amount,
                "currency": "RUB"
            },
            "confirmation": {
                "type": "redirect",
                "return_url": "https://www.cakenuage.com"
            },
            "capture": False,
            "description": "Заказ №1"
        })

        order_items = order.items.all()
        order_items.update(ordered=True)
        for item in order_items:
            item.save()

        order.ordered = True
        # order.paying = amount
        order.delivery_date = formdata
        order.delivery = delivery
        # order.ref_code = create_ref_code()
        order.save()
        return Response(payment.confirmation.confirmation_url,
                        status=HTTP_200_OK)


class ItemDetailView(RetrieveAPIView):
    permission_classes = (AllowAny, )
    serializer_class = ItemDetailSerializer
    queryset = Item.objects.all()
    lookup_field = 'slug'


class OrderQuantityUpdateView(APIView):

    def post(self, request, *args, **kwargs):
        slug = request.data.get('slug', None)
        if slug is None:
            return Response({"message": "Invalid data"},
                            status=HTTP_400_BAD_REQUEST)
        item = get_object_or_404(Item, slug=slug)
        order_qs = Order.objects.filter(user=request.user, ordered=False)
        if order_qs.exists():
            order = order_qs[0]
            # check if the order item is in the order
            if order.items.filter(item__slug=item.slug).exists():
                order_item = OrderItem.objects.filter(item=item,
                                                      user=request.user,
                                                      ordered=False)[0]
                if order_item.quantity > 1:
                    order_item.quantity -= 1
                    order_item.save()
                else:
                    order.items.remove(order_item)
                return Response(status=HTTP_200_OK)
            else:
                return Response({"message": "This item was not in your cart"},
                                status=HTTP_400_BAD_REQUEST)
        else:
            return Response({"message": "You do not have an active order"},
                            status=HTTP_400_BAD_REQUEST)


class OrderItemDeleteView(DestroyAPIView):
    permission_classes = (IsAuthenticated, )
    queryset = OrderItem.objects.all()


class AddToCartView(APIView):

    def post(self, request, *args, **kwargs):
        slug = request.data.get('slug', None)
        variations = request.data.get('variations', [])
        if slug is None:
            return Response({"message": "Invalid request"},
                            status=HTTP_400_BAD_REQUEST)

        item = get_object_or_404(Item, slug=slug)

        minimum_variation_count = Variation.objects.filter(item=item).count()
        if len(variations) < minimum_variation_count:
            return Response(
                {"message": "Please specify the required variation types"},
                status=HTTP_400_BAD_REQUEST)

        order_item_qs = OrderItem.objects.filter(item=item,
                                                 user=request.user,
                                                 ordered=False)
        for v in variations:
            order_item_qs = order_item_qs.filter(Q(item_variations__exact=v))

        if order_item_qs.exists():
            order_item = order_item_qs.first()
            order_item.quantity += 1
            order_item.save()
        else:
            order_item = OrderItem.objects.create(item=item,
                                                  user=request.user,
                                                  ordered=False)
            order_item.item_variations.add(*variations)
            order_item.save()

        order_qs = Order.objects.filter(user=request.user, ordered=False)
        if order_qs.exists():
            order = order_qs[0]
            if not order.items.filter(item__id=order_item.id).exists():
                order.items.add(order_item)
                return Response(status=HTTP_200_OK)

        else:
            ordered_date = timezone.now()
            order = Order.objects.create(user=request.user,
                                         ordered_date=ordered_date)
            order.items.add(order_item)
            return Response(status=HTTP_200_OK)


class OrderDetailView(RetrieveAPIView):
    serializer_class = OrderSerializer
    permission_classes = (IsAuthenticated, )

    def get_object(self):
        try:
            order = Order.objects.get(user=self.request.user, ordered=False)
            return order
        except ObjectDoesNotExist:
            raise Http404("You do not have an active order")
            # return Response({"message": "You do not have an active order"}, status=HTTP_400_BAD_REQUEST)


class AddCouponView(APIView):

    def post(self, request, *args, **kwargs):
        code = request.data.get('code', None)
        if code is None:
            return Response({"message": "Invalid data received"},
                            status=HTTP_400_BAD_REQUEST)
        order = Order.objects.get(user=self.request.user, ordered=False)
        coupon = get_object_or_404(Coupon, code=code)
        order.coupon = coupon
        order.save()
        return Response(status=HTTP_200_OK)


class CountryListView(APIView):

    def get(self, request, *args, **kwargs):
        return Response(countries, status=HTTP_200_OK)


class AddressListView(ListAPIView):
    permission_classes = (IsAuthenticated, )
    serializer_class = AddressSerializer

    def get_queryset(self):
        address_type = self.request.query_params.get('address_type', None)
        qs = Address.objects.all()
        return qs.filter(user=self.request.user)


class AddressCreateView(CreateAPIView):
    permission_classes = (IsAuthenticated, )
    serializer_class = AddressSerializer
    queryset = Address.objects.all()


class AddressUpdateView(UpdateAPIView):
    permission_classes = (IsAuthenticated, )
    serializer_class = AddressSerializer
    queryset = Address.objects.all()


class AddressDeleteView(DestroyAPIView):
    permission_classes = (IsAuthenticated, )
    queryset = Address.objects.all()


class PaymentListView(ListAPIView):
    permission_classes = (IsAuthenticated, )
    serializer_class = PayingSerializer

    def get_queryset(self):
        return Paying.objects.filter(user=self.request.user)


# # Add this CBV
class Assets(View):

    def get(self, _request, filename):
        path = os.path.join(os.path.dirname(__file__), "static", filename)

        if os.path.isfile(path):
            with open(path, "rb") as file:
                return HttpResponse(file.read(),
                                    content_type="application/javascript")
        else:
            return HttpResponseNotFound()
