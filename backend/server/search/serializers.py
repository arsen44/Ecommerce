import json
from rest_framework import serializers
from django_elasticsearch_dsl_drf.serializers import DocumentSerializer

from core.documents import ItemDocument, TagDocument, CategoryDocument


class CategoryDocumentSerializer(serializers.Serializer):
    """Serializer for a Tag document."""

    class Meta:
        """Meta options."""

        document = CategoryDocument
        fields = (
            'id',
            'name',

        )


class TagDocumentSerializer(serializers.Serializer):
    """Serializer for a Tag document."""

    class Meta:
        """Meta options."""

        document = TagDocument
        fields = (
            'id',
            'title',
        )


class ItemDocumentSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    media = serializers.SerializerMethodField()
    title = serializers.CharField(read_only=True)
    description = serializers.CharField(read_only=True)
    category = serializers.CharField(read_only=True)
    media_type = serializers.CharField(read_only=True)
    width = serializers.IntegerField(read_only=True)
    height = serializers.IntegerField(read_only=True)
    price = serializers.FloatField(read_only=True)
    discount_price = serializers.FloatField(read_only=True)
    dateOfreadiness = serializers.IntegerField(read_only=True)
    slug = serializers.SlugField(read_only=True)
    tags = serializers.CharField(read_only=True)

    class Meta:
        document = ItemDocument
        fields = ['id', 'title', 'price ', 'discount_price', 'height',
                  'width', 'dateOfreadiness', 'description', 'label', 'category', 'media',
                  'slug', 'media_type', 'tags']

    def create(self, validated_data):
        """Create.
        Do nothing.
        :param validated_data:
        :return:
        """

    def update(self, instance, validated_data):
        """Update.
        Do nothing.
        :param instance:
        :param validated_data:
        :return:
        """

    def get_tags(self, obj):
        """Get tags."""
        if obj.tags:
            return list(obj.tags)
        else:
            return []

    def get_category(self, obj):
        """Get tags."""
        if obj.category:
            return list(obj.category)
        else:
            return []

    def get_media(self, obj):
        request = self.context.get('request')
        media = obj.media
        return request.build_absolute_uri(media)

    def get_sort_value(self, obj):
        try:
            return obj.meta.sort._l_[0]
        except Exception:
            return None
