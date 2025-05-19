# api/urls.py
from rest_framework import routers
from django.urls import path, include
from .views import UserViewSet

router = routers.DefaultRouter()
router.register(r'users', UserViewSet, basename='users')

urlpatterns = [
    path('', include(router.urls)),
]
