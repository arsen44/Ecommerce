from rest_framework import serializers
from core.models import (Address, Item, Order, OrderItem, Coupon, Variation,
                         ItemVariation, Paying, MediaContent, Category, Carousel)
from datetime import datetime, timedelta


class StringSerializer(serializers.StringRelatedField):

    def to_internal_value(self, value):

        return value


class CarouselSerializer(serializers.ModelSerializer):

    class Meta:
        model = Carousel
        fields = ('id', 'name', 'slug', 'mediacarousel')


class CouponSerializer(serializers.ModelSerializer):

    class Meta:
        model = Coupon
        fields = ('id', 'code', 'amount')


class MediaSerializer(serializers.ModelSerializer):

    class Meta:
        model = MediaContent
        fields = "__all__"


class ItemSerializer(serializers.ModelSerializer):
    label = serializers.SerializerMethodField()

    class Meta:
        model = Item
        fields = ('id', 'title', 'price', 'discount_price', 'dateOfreadiness',
                  'category', 'label', 'slug', 'description', 'media',
                  'media_type', 'height', 'width')

    def get_label(self, obj):
        return obj.get_label_display()


class CategorySerializer(serializers.ModelSerializer):

    class Meta:
        model = Category
        fields = ('id', 'name', 'slug', 'mediacontent', 'seo_description')


class CategoryDeatilSerializer(serializers.ModelSerializer):
    item = serializers.SerializerMethodField()
    lookup_field = 'slug'

    class Meta:
        model = Category
        fields = ('id', 'name', 'slug', 'seo_description', 'item')

    def get_item(self, obj):
        return ItemSerializer(obj.item_set.all(), many=True).data


class VariationDetailSerializer(serializers.ModelSerializer):
    item = serializers.SerializerMethodField()

    class Meta:
        model = Variation
        fields = (
            'id',
            'name',
            'item',
        )

    def get_item(self, obj):
        return ItemSerializer(obj.item).data


class ItemVariationDetailSerializer(serializers.ModelSerializer):
    variation = serializers.SerializerMethodField()

    class Meta:
        model = ItemVariation
        fields = (
            'id',
            'value',
            'attachment',
            'variation',
            'description',
        )

    def get_variation(self, obj):
        return VariationDetailSerializer(obj.variation).data


class OrderItemSerializer(serializers.ModelSerializer):
    item_variations = serializers.SerializerMethodField()
    item = serializers.SerializerMethodField()
    final_price = serializers.SerializerMethodField()
    final_date = serializers.SerializerMethodField()

    class Meta:
        model = OrderItem
        fields = ('id', 'item', 'item_variations', 'quantity', 'final_price',
                  'final_date')

    def get_item(self, obj):
        return ItemSerializer(obj.item).data

    def get_item_variations(self, obj):
        return ItemVariationDetailSerializer(obj.item_variations.all(),
                                             many=True).data

    def get_final_price(self, obj):
        return obj.get_final_price()

    def get_final_date(self, obj):
        return obj.get_final_date()


class OrderSerializer(serializers.ModelSerializer):
    order_items = serializers.SerializerMethodField()
    total = serializers.SerializerMethodField()
    coupon = serializers.SerializerMethodField()
    date = serializers.SerializerMethodField()
    not_discount_amount = serializers.SerializerMethodField()
    total_amount_discounts = serializers.SerializerMethodField()
    delivery = serializers.SerializerMethodField()

    class Meta:
        model = Order
        fields = ('id', 'order_items', 'total', 'coupon', 'delivery_date',
                  'date', 'not_discount_amount', 'total_amount_discounts',
                  'delivery')

    def get_order_items(self, obj):
        return OrderItemSerializer(obj.items.all(), many=True).data

    def get_total(self, obj):
        return obj.get_total()

    def get_coupon(self, obj):
        if obj.coupon is not None:
            return CouponSerializer(obj.coupon).data
        return None

    def get_date(self, obj):
        return obj.get_date()

    def get_not_discount_amount(self, obj):
        return obj.get_not_discount_amount()

    def get_total_amount_discounts(self, obj):
        return obj.get_total_amount_discounts()


# Выбор способи доставки (доставка/самовывоз)


    def get_delivery(self, obj):
        return obj.get_delivery()


class ItemVariationSerializer(serializers.ModelSerializer):

    class Meta:
        model = ItemVariation
        fields = ('id', 'value', 'attachment', 'description')


class VariationSerializer(serializers.ModelSerializer):
    item_variations = serializers.SerializerMethodField()

    class Meta:
        model = Variation
        fields = ('id', 'name', 'item_variations')

    def get_item_variations(self, obj):
        return ItemVariationSerializer(obj.itemvariation_set.all(),
                                       many=True).data


class ItemDetailSerializer(serializers.ModelSerializer):
    label = serializers.SerializerMethodField()
    variations = serializers.SerializerMethodField()
    lookup_field = 'slug'
    mediacontent = serializers.SerializerMethodField()

    class Meta:
        model = Item
        fields = ('id', 'title', 'price', 'discount_price', 'dateOfreadiness',
                  'category', 'label', 'slug', 'description', 'media',
                  'variations', 'media_type', 'mediacontent','available')

    def get_category(self, obj):
        return obj.get_category_display()

    def get_label(self, obj):
        return obj.get_label_display()

    def get_variations(self, obj):
        return VariationSerializer(obj.variation_set.all(), many=True).data

    def get_mediacontent(self, obj):
        return MediaSerializer(obj.mediacontent_set.all(), many=True).data


class AddressSerializer(serializers.ModelSerializer):

    class Meta:
        model = Address
        fields = ('id', 'user', 'street_address', 'apartment_address',
                  'apartment_floor', 'apartment_entrance',
                  'apartment_intercom', 'phone', 'default')


class PayingSerializer(serializers.ModelSerializer):

    class Meta:
        model = Paying
        fields = ('id', 'amount', 'timestamp')
