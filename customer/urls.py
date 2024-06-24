# customer/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('new/', views.customer_create, name='customer_create'),
    path('<int:pk>/', views.customer_detail, name='customer_detail'),
]
