from django_elasticsearch_dsl import Document, fields
from django_elasticsearch_dsl_drf.compat import KeywordField, StringField
from django_elasticsearch_dsl_drf.analyzers import edge_ngram_completion
from django_elasticsearch_dsl_drf.versions import ELASTICSEARCH_GTE_5_0
from django_elasticsearch_dsl.registries import registry
from elasticsearch_dsl import analyzer
from .models import Item, Tag, Category


html_strip = analyzer(
    'html_strip',
    tokenizer="standard",
    filter=["lowercase", "stop", "snowball"],
    char_filter=["html_strip"]
)


@registry.register_document
class CategoryDocument(Document):
    """Elasticsearch document for a Tag."""

    # Set unique title as the document id.
    id = fields.KeywordField(attr='name')
    name = fields.KeywordField()

    class Index:
        name = 'category'
        settings = {'number_of_shards': 1,
                    'number_of_replicas': 0}

    class Django(object):
        model = Category


@registry.register_document
class TagDocument(Document):
    """Elasticsearch document for a Tag."""

    # Set unique title as the document id.
    id = fields.KeywordField(attr='title')
    title = fields.KeywordField()

    class Index:
        name = 'tag'
        settings = {'number_of_shards': 1,
                    'number_of_replicas': 1}

    class Django(object):
        model = Tag

    class Meta:
        parellel_indexing = True


@ registry.register_document
class ItemDocument(Document):
    """Book Elasticsearch document."""
    id = fields.IntegerField(attr='id')

    __title_fields = {
        'raw': KeywordField(),
        'suggest': fields.CompletionField(),
        'edge_ngram_completion': StringField(
            analyzer=edge_ngram_completion
        ),
        'mlt': StringField(analyzer='english'),
    }

    title = StringField(
        analyzer=html_strip,
        fields=__title_fields
    )

    description = StringField(
        analyzer=html_strip,
        fields={
            'raw': KeywordField(),
            'mlt': StringField(analyzer='russian'),
        }
    )

    label = StringField(
        analyzer=html_strip,
        fields={
            'raw': KeywordField(),
        }
    )

    category = StringField(
        attr=' category_indexing',
        analyzer=html_strip,
        fields={
            'raw': KeywordField(multi=True),
            'suggest': fields.CompletionField(multi=True),
        }
    )

    tags = StringField(
        attr='tags_indexing',
        analyzer=html_strip,
        fields={
            'raw': KeywordField(multi=True),
            'suggest': fields.CompletionField(multi=True),
        },
        multi=True
    )

    media = fields.FileField()
    price = fields.FloatField()
    discount_price = fields.FloatField()
    height = fields.IntegerField()
    width = fields.IntegerField()
    dateOfreadiness = fields.IntegerField()
    media_type = StringField()
    slug = StringField(attr='slug')

    class Index:
        name = 'item'
        settings = {'number_of_shards': 1,
                    'number_of_replicas': 1}

    class Django:
        model = Item

    class Meta:
        parallel_indexing = True
