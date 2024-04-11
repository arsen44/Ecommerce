from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import ItemDocumentViewSet

router = DefaultRouter()

router.register(
    '',
    ItemDocumentViewSet,
    basename='search-products'
)

urlpatterns = [
    path('', include(router.urls)),
]
