# Koketso Mabuela Assessment | Tentpole | Q1

A web-based Django application for managing customer information and visualizing financial data, containerized with Docker.

## Overview

This Django project serves as a workflow system for capturing customer information and visualizing financial data over time. Users can input customer details via HTML forms and upload Excel files containing financial records. The system processes this data to generate temporal graphs depicting income and expenditure trends for the last 12 months.

## Features

- **Customer Information Capture**: Users can enter customer details including first name, last name, and date of birth using a simple HTML form.
  
- **Financial Data Upload**: Customers' financial data for the last 12 months can be uploaded via an Excel file. The system parses and analyzes this data to generate insights.
  
- **Temporal Graph Visualization**: The system generates and displays a temporal graph using Matplotlib, showing the trends in income and expenditure over the past year.

## Assumptions

- **Single User Environment**: The system assumes it will be used by a single user at a time, thus omitting user authentication and management features.
  
- **Technology Stack**: The project uses Django 3.2, Python 3.7, pandas for data manipulation, Matplotlib for graph generation, and Bootstrap for basic UI styling.
  
- **Data Storage**: SQLite is used as the database for its simplicity. For larger-scale deployments or specific requirements, migration to a more robust database system may be necessary.
  
- **Minimal UI**: The user interface is kept minimal, focusing on functionality over aesthetics. HTML forms are used for data entry, with basic styling provided by Bootstrap.
  
- **Workflow Flexibility**: The workflow for capturing data and generating graphs is designed to be extensible. Additional features or changes can be accommodated by extending Django views, templates, or models.

## Docker Setup

This project is containerized using Docker for easy deployment and scalability across different environments.

### Prerequisites

- Docker installed on your local machine or server.

### Installation and Usage

1. **Clone the repository:**

   ```bash
   git clone https://github.com/KoketsoMabuela92/tentpole_django_assessment.git
   cd tentpole_django_assessment
   
2. **Build the Docker image:**

   ```bash
   docker build -t customer-workflow-app .

3. **Run the Docker container:**

```bash
docker run -p 8000:8000 customer-workflow-app

```
This command maps port 8000 of the Docker container to port 8000 on your local machine.

4. **Access the application:**

   ```bash
   Open your web browser and go to http://localhost:8000/customer/new/ to use the application.
    
5. **Technologies used**
 - Python 3.7
 - Django 3.2
 - pandas
 - Matplotlib
 - Bootstrap (for basic styling)
