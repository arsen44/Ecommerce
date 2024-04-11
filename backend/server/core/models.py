from typing import List
from django.db.models.signals import post_save
from django.conf import settings
from django.db import models
from django.shortcuts import reverse
from django.utils import timezone

CATEGORY_CHOICES = (
    ('готовые торты', 'готовые торты'),
    ('детские', 'детские'),
    ('свадебные', 'свадебные'),
    ('корпоративные', 'корпоративные'),
    ('candybar', 'candybar'),
    ('фотопечать', 'фотопечать'),
    ('ягодные', 'ягодные'),
    ('девочкам', 'девочкам'),
    ('Супер VIP', 'Супер VIP'),
    ('все для кондитеров', 'все для кондитеров'),
)

LABEL_CHOICES = (
    ('P', 'Хит'),
    ('S', 'Новинка'),
)

ADDRESS_CHOICES = (
    ('B', 'Платежный адрес'),
    ('S', 'Адрес доставки'),
)

MEDIA_TYPE = (
    ('image', 'image'),
    ('video', 'video'),
)


class UserProfile(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL,
                                on_delete=models.CASCADE)
    stripe_customer_id = models.CharField(max_length=50, blank=True, null=True)
    one_click_purchasing = models.BooleanField(default=False)

    def __str__(self):
        return self.user.username


class Category(models.Model):
    name = models.CharField(max_length=200, db_index=True)
    slug = models.SlugField(max_length=200, unique=True)
    mediacontent = models.ImageField()
    seo_description = models.TextField()
    

    class Meta:
        ordering = ('name',)
        verbose_name = 'category'
        verbose_name_plural = 'categories'

    def __str__(self):
        return self.name


class Carousel (models.Model):
    name = models.CharField(max_length=200, db_index=True)
    slug = models.SlugField(max_length=200, unique=True)
    mediacarousel = models.ImageField()

    def __str__(self):
        return self.name


class Tag(models.Model):
    title = models.CharField(max_length=255, unique=True)

    class Meta:
        verbose_name = 'Tag'
        verbose_name_plural = 'Tags'

    def __str__(self):
        return self.title


class Item(models.Model):
    category = models.ForeignKey(
        Category, on_delete=models.CASCADE)
    title = models.CharField(max_length=100)
    price = models.FloatField()
    dateOfreadiness = models.PositiveIntegerField(blank=True, null=True)
    discount_price = models.FloatField(blank=True, null=True)
    label = models.CharField(choices=LABEL_CHOICES,
                             max_length=10,
                             blank=True,
                             null=True)
    slug = models.SlugField(max_length=100, db_index=True, unique=True)
    description = models.TextField()
    media = models.FileField(blank=True, null=True)
    media_type = models.CharField(choices=MEDIA_TYPE,
                                  max_length=10,
                                  blank=True,
                                  null=True)
    height = models.IntegerField(blank=True, null=True)
    width = models.IntegerField(blank=True, null=True)
    tags = models.ManyToManyField(Tag, blank=True)
    available = models.BooleanField(default=True)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse("core:product", kwargs={'slug': self.slug})

    def get_add_to_cart_url(self):
        return reverse("core:add-to-cart", kwargs={'slug': self.slug})

    def get_remove_from_cart_url(self):
        return reverse("core:remove-from-cart", kwargs={'slug': self.slug})

    @property
    def tags_indexing(self):
        """Tags for indexing.
        Used in Elasticsearch indexing.
        """
        return [tag.title for tag in self.tags.all()]

    @property
    def category_indexing(self):
        """Tags for indexing.
        Used in Elasticsearch indexing.
        """
        return [category.name for category in self.category.all()]


class MediaContent(models.Model):
    name = models.CharField(max_length=255)
    item = models.ForeignKey(Item, on_delete=models.CASCADE)
    media_content = models.FileField(blank=True, null=True)
    media_content_type = models.CharField(choices=MEDIA_TYPE, max_length=20)
    height = models.IntegerField(blank=True, null=True)
    width = models.IntegerField(blank=True, null=True)


class Variation(models.Model):
    item = models.ForeignKey(Item, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)

    class Meta:
        unique_together = (('item', 'name'))

    def __str__(self):
        return self.name


class ItemVariation(models.Model):
    variation = models.ForeignKey(Variation, on_delete=models.CASCADE)
    value = models.CharField(max_length=50)
    attachment = models.ImageField()
    description = models.TextField()

    class Meta:
        unique_together = (('variation', 'value'))

    def __str__(self):
        return self.value


class OrderItem(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             on_delete=models.CASCADE)
    ordered = models.BooleanField(default=False)
    item = models.ForeignKey(Item, on_delete=models.CASCADE)
    item_variations = models.ManyToManyField(ItemVariation)
    quantity = models.IntegerField(default=1)

    def __str__(self):
        return f"{self.quantity} of {self.item.title}"

    def get_total_item_price(self):
        return self.quantity * self.item.price

    def get_total_discount_item_price(self):
        return self.quantity * self.item.discount_price

    def get_amount_saved(self):
        return self.get_total_item_price(
        ) - self.get_total_discount_item_price()

    def get_final_price(self):
        if self.item.discount_price:
            return self.get_total_discount_item_price()
        return self.get_total_item_price()

    def get_final_date(self):
        return self.item.dateOfreadiness


class Order(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             on_delete=models.CASCADE)
    ref_code = models.CharField(max_length=20, blank=True, null=True)
    items = models.ManyToManyField(OrderItem)
    start_date = models.DateTimeField(auto_now_add=True)
    ordered_date = models.DateTimeField()
    ordered = models.BooleanField(default=False)
    shipping_address = models.ForeignKey('Address',
                                         related_name='shipping_address',
                                         on_delete=models.SET_NULL,
                                         blank=True,
                                         null=True)
    payment = models.ForeignKey('Paying',
                                on_delete=models.SET_NULL,
                                blank=True,
                                null=True)
    coupon = models.ForeignKey('Coupon',
                               on_delete=models.SET_NULL,
                               blank=True,
                               null=True)
    being_delivered = models.BooleanField(default=False)
    received = models.BooleanField(default=False)
    refund_requested = models.BooleanField(default=False)
    refund_granted = models.BooleanField(default=False)
    delivery_date = models.CharField(max_length=100)
    delivery = models.CharField(max_length=100)

    def __str__(self):
        return self.user.username

# Выбор сбостки досавки

    def get_delivery(self):
        return self.delivery

# Расчет доставки

    def get_total(self):
        total = 0
        for order_item in self.items.all():
            total += order_item.get_final_price()
        if self.coupon:
            total -= self.coupon.amount
        return total

    def get_date(self):
        data = []
        for order_item in self.items.all():
            data = [order_item.get_final_date()]
        return data
# Итогвая сумма всех закзаов без скилок

    def get_not_discount_amount(self):
        not_discount_amount = 0
        for order_items in self.items.all():
            not_discount_amount += order_items.get_total_item_price()
        return not_discount_amount


# Итогвая сумма скидок всех закзаов


    def get_total_amount_discounts(self):
        total_amount_discounts = 0
        for order_items in self.items.all():
            total_amount_discounts += order_items.get_final_price() - \
                order_items.get_total_item_price()
        return total_amount_discounts


class Address(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             on_delete=models.CASCADE)
    street_address = models.CharField(max_length=100)
    apartment_address = models.CharField(max_length=100)
    apartment_floor = models.CharField(max_length=10)
    apartment_entrance = models.CharField(max_length=10)
    apartment_intercom = models.CharField(max_length=10)
    phone = models.CharField(max_length=15)
    default = models.BooleanField(default=False)

    def __str__(self):
        return self.user.username

    class Meta:
        verbose_name_plural = 'Addresses'


class Paying(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             on_delete=models.SET_NULL,
                             blank=True,
                             null=True)
    amount = models.FloatField()
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.user.username


class Coupon(models.Model):
    code = models.CharField(max_length=15)
    amount = models.FloatField()

    def __str__(self):
        return self.code


class Refund(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    reason = models.TextField()
    accepted = models.BooleanField(default=False)
    email = models.EmailField()

    def __str__(self):
        return f"{self.pk}"


def userprofile_receiver(sender, instance, created, *args, **kwargs):
    if created:
        userprofile = UserProfile.objects.create(user=instance)


post_save.connect(userprofile_receiver, sender=settings.AUTH_USER_MODEL)
