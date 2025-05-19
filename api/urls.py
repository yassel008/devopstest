from .views import *
from django.urls import path
from .views import UserViewSet  # importa explícitamente lo que usas

urlpatterns = [
    path('users/', UserViewSet.as_view({'get': 'list'})),
]

urlpatterns = router.urls
