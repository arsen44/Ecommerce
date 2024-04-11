from django_elasticsearch_dsl_drf.constants import (
    LOOKUP_FILTER_RANGE,
    LOOKUP_FILTER_TERMS,
    LOOKUP_QUERY_GT,
    LOOKUP_QUERY_GTE,
    LOOKUP_QUERY_IN,
    LOOKUP_QUERY_LT,
    LOOKUP_QUERY_LTE,
    SUGGESTER_COMPLETION,
    SUGGESTER_PHRASE,
    SUGGESTER_TERM,
    LOOKUP_FILTER_PREFIX,
    LOOKUP_FILTER_WILDCARD,
    LOOKUP_QUERY_EXCLUDE,
    LOOKUP_QUERY_ISNULL,
    LOOKUP_FILTER_TERMS
)
from django_elasticsearch_dsl_drf.filter_backends import (
    DefaultOrderingFilterBackend,
    FacetedSearchFilterBackend,
    FilteringFilterBackend,
    IdsFilterBackend,
    OrderingFilterBackend,
    CompoundSearchFilterBackend,
    SearchFilterBackend,
    SuggesterFilterBackend,
    HighlightBackend
)

from django_elasticsearch_dsl_drf.viewsets import (
    DocumentViewSet,


)
from django_elasticsearch_dsl_drf.pagination import PageNumberPagination

from core.documents import ItemDocument, TagDocument
from .serializers import ItemDocumentSerializer, TagDocumentSerializer

from elasticsearch_dsl import (
    DateHistogramFacet,
    RangeFacet,
    TermsFacet,
)


class CustomPageNumberPagination(PageNumberPagination):
    page_size = 15
    page_size_query_param = 'page_size'

class TagDocumentViewSet(DocumentViewSet):
    """Document viewset for tags."""

    document = TagDocument
    serializer_class = TagDocumentSerializer
    lookup_field = 'title'
    filter_backends = []
    pagination_class = CustomPageNumberPagination


class ItemDocumentViewSet(DocumentViewSet):

    pagination_class = CustomPageNumberPagination
    document = ItemDocument
    serializer_class = ItemDocumentSerializer
    lookup_field = 'id'

    filter_backends = [
        OrderingFilterBackend,
        DefaultOrderingFilterBackend,
        CompoundSearchFilterBackend,
        SuggesterFilterBackend,
        SearchFilterBackend,
        HighlightBackend,
        FilteringFilterBackend,
    ]

    search_fields = (
        'title',
        'description',
        'media',
        "category"
    )

    highlight_fields = {
        'title': {
            'enabled': True,
            'options': {
                'pre_tags': ["<b>"],
                'post_tags': ["</b>"],
            }
        }
    }

    suggester_fields = {
        "name_suggest": {
            "field": "title.suggest",
            "suggesters": [SUGGESTER_COMPLETION]
        },
        'options': {
            'size': 20,  # Override default number of suggestions
            # Whether duplicate suggestions should be filtered out.
            'skip_duplicates': True,
        },
    }

    filter_fields = {
        'id': {
            'field': 'id',
            # Note, that we limit the lookups of id field in this example,
            # to `range`, `in`, `gt`, `gte`, `lt` and `lte` filters.
            'lookups': [
                LOOKUP_FILTER_RANGE,
                LOOKUP_QUERY_IN,
                LOOKUP_QUERY_GT,
                LOOKUP_QUERY_GTE,
                LOOKUP_QUERY_LT,
                LOOKUP_QUERY_LTE,
            ],
        },
        'title': 'title.raw',
        'price': {
            'field': 'price.raw',
            # Note, that we limit the lookups of `price` field in this
            # example, to `range`, `gt`, `gte`, `lt` and `lte` filters.
            'lookups': [
                LOOKUP_FILTER_RANGE,
                LOOKUP_QUERY_GT,
                LOOKUP_QUERY_GTE,
                LOOKUP_QUERY_LT,
                LOOKUP_QUERY_LTE,
            ],
        },
        'tags': {
            'field': 'tags',
            'lookups': [
                LOOKUP_FILTER_TERMS,
                LOOKUP_FILTER_PREFIX,
                LOOKUP_FILTER_WILDCARD,
                LOOKUP_QUERY_IN,
                LOOKUP_QUERY_EXCLUDE,
            ],
        },
        'tags.raw': {
            'field': 'tags.raw',
            'lookups': [
                LOOKUP_FILTER_TERMS,
                LOOKUP_FILTER_PREFIX,
                LOOKUP_FILTER_WILDCARD,
                LOOKUP_QUERY_IN,
                LOOKUP_QUERY_EXCLUDE,
            ],
        },
    }

    post_filter_fields = {
        'tags_pf': {
            'field': 'tags',
            'lookups': [
                LOOKUP_FILTER_TERMS,
                LOOKUP_FILTER_PREFIX,
                LOOKUP_FILTER_WILDCARD,
                LOOKUP_QUERY_IN,
                LOOKUP_QUERY_EXCLUDE,
                LOOKUP_QUERY_ISNULL,
            ],
        },
        'tags_raw_pf': {
            'field': 'tags.raw',
            'lookups': [
                LOOKUP_FILTER_TERMS,
                LOOKUP_FILTER_PREFIX,
                LOOKUP_FILTER_WILDCARD,
                LOOKUP_QUERY_IN,
                LOOKUP_QUERY_EXCLUDE,
            ],
        },
    }

    ordering_fields = {
        'id': 'id',
        'title': 'title.raw',
        'description': 'description.raw',
        'category': 'category.row',
        'price': 'price.row',
        'media': 'media.row'

    }
