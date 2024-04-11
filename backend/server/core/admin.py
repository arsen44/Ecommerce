from django.contrib import admin
from django.utils.html import format_html
from .models import (Item, OrderItem, Order, Paying, Coupon, Refund, Address,
                     UserProfile, Variation, ItemVariation, MediaContent, Tag, Carousel, Category)


def make_refund_accepted(modeladmin, request, queryset):
    queryset.update(refund_requested=False, refund_granted=True)


make_refund_accepted.short_description = 'Update orders to refund granted'


class OrderAdmin(admin.ModelAdmin):
    list_display = [
        'user', 'ordered', 'being_delivered', 'received', 'refund_requested',
        'refund_granted', 'shipping_address', 'payment', 'coupon'
    ]
    list_display_links = ['user', 'shipping_address', 'payment', 'coupon']
    list_filter = [
        'ordered', 'being_delivered', 'received', 'refund_requested',
        'refund_granted'
    ]
    search_fields = ['user__username', 'ref_code']
    actions = [make_refund_accepted]


class AddressAdmin(admin.ModelAdmin):
    list_display = [
        'user', 'street_address', 'apartment_address', 'apartment_floor',
        'apartment_entrance', 'apartment_intercom', 'phone', 'default'
    ]
    list_filter = 'default',
    search_fields = [
        'user', 'street_address', 'apartment_address', 'apartment_floor',
        'apartment_entrance', 'apartment_intercom', 'phone'
    ]


class ItemVariationAdmin(admin.ModelAdmin):
    list_display = ['variation', 'value', 'attachment']
    list_filter = ['variation', 'variation__item']
    search_fields = ['value']


class ItemVariationInLineAdmin(admin.TabularInline):
    model = ItemVariation
    extra = 1


class VariationAdmin(admin.ModelAdmin):
    list_display = ['item', 'name']
    list_filter = ['item']
    search_fields = ['name']
    inlines = [ItemVariationInLineAdmin]


class ItemMdeiaAdmin(admin.StackedInline):
    model = MediaContent


class ItemAdmin(admin.ModelAdmin):
    inlines = [ItemMdeiaAdmin]
    list_display = [
        'title', 'slug', 'price', 'dateOfreadiness', 'label', 'description',
        'media', 'media_type'
    ]
    prepopulated_fields = {'slug': ('title', )}


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    """Tag admin."""

    list_display = ('title',)
    search_fields = ('title',)


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'slug']
    prepopulated_fields = {'slug': ('name',)}


admin.site.register(ItemVariation, ItemVariationAdmin)
admin.site.register(Variation, VariationAdmin)
admin.site.register(Item, ItemAdmin)
admin.site.register(OrderItem)
admin.site.register(Order, OrderAdmin)
admin.site.register(Paying)
admin.site.register(Coupon)
admin.site.register(Refund)
admin.site.register(Address, AddressAdmin)
admin.site.register(UserProfile)
admin.site.register(Carousel)
