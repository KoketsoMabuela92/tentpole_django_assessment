# customer/views.py

from django.shortcuts import render, redirect
from .forms import CustomerForm
from .models import Customer
import matplotlib
import pandas as pd
import matplotlib.pyplot as plt
import io
import base64
import urllib.parse

matplotlib.use('Agg')


def customer_create(request):
    if request.method == 'POST':
        form = CustomerForm(request.POST, request.FILES)
        if form.is_valid():
            customer = form.save()
            return redirect('customer_detail', pk=customer.pk)
    else:
        form = CustomerForm()
    return render(request, 'customer/customer_form.html', {'form': form})


def customer_detail(request, pk):
    customer = Customer.objects.get(pk=pk)
    excel_file = customer.excel_file.path
    data = pd.read_excel(excel_file)

    # Generate plot
    plt.figure()
    data.plot(x='Month', y=['Income', 'Expenses'], kind='line')
    plt.title('Income and Expenditure Over Time')
    plt.xlabel('Month')
    plt.ylabel('Amount')

    # Save plot to a BytesIO buffer
    buf = io.BytesIO()
    plt.savefig(buf, format='png')
    buf.seek(0)
    plot_data = base64.b64encode(buf.read()).decode('utf-8')
    plt.close()  # Close the plot to release resources

    return render(request, 'customer/customer_detail.html', {'customer': customer, 'plot_data': plot_data})