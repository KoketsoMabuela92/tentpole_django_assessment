from django.db import models

# Create your models here.
# customer/models.py
from django.db import models

class Customer(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    date_of_birth = models.DateField()
    excel_file = models.FileField(upload_to='uploads/')

    def __str__(self):
        return f'{self.first_name} {self.last_name}'
