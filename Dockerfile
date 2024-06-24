# Dockerfile

# Use the official Python image from the Docker Hub
FROM python:3.7

LABEL authors="koketsomabuela"

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /code

# Install dependencies
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Copy the Django project code into the container
COPY . /code/

# Run migrations and collect static files (if applicable)
RUN python manage.py migrate
RUN python manage.py collectstatic --noinput

# Expose the port on which Django runs (default is 8000)
EXPOSE 8000

# Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
