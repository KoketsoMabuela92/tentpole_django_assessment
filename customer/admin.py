from django.contrib import admin

# Register your models here.

# customer/admin.py
from django.contrib import admin
from .models import Customer

admin.site.register(Customer)
