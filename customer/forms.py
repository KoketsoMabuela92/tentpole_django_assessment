# customer/forms.py

from django import forms
from .models import Customer

class DateInput(forms.DateInput):
    input_type = 'date'

class CustomerForm(forms.ModelForm):
    class Meta:
        model = Customer
        fields = ['first_name', 'last_name', 'date_of_birth', 'excel_file']
        widgets = {
            'date_of_birth': DateInput(),
        }

    def clean_date_of_birth(self):
        date_of_birth = self.cleaned_data['date_of_birth']
        # Add custom validation for date_of_birth if needed
        return date_of_birth
