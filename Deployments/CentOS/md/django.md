# Deploy a Python/Django REST API on CentOS with Gunicorn

This guide outlines the steps to deploy a Python/Django REST API on a CentOS server using Gunicorn.

## 1. Update System Packages

sudo yum update -y

## 2. Install Python and Development Tools

sudo yum install python3-pip -y

## 3. Create and Activate Virtual Environment

python3 -m venv venv

source venv/bin/activate

## 4. Clone the Project

git clone https://github.com/GerromeSieger/RecipeApp-Django.git

cd RecipeApp-Django

## 5. Install Dependencies

pip install -r requirements.txt

## 6. Configure Database

### Ensure your database connection is properly configured in the Django settings

## 7. Run Migrations

python manage.py migrate

## 8. Run Application with Gunicorn

gunicorn --bind 0.0.0.0:8000 RecipeApp.wsgi:application

## Alternative Deployment Strategy (Using Systemd)

### 9. Create Gunicorn Service File

sudo nano /etc/systemd/system/gunicorn.service

### Add the following content (adjust paths as necessary):

```ini
[Unit]
Description=Gunicorn daemon for Django API
After=network.target

[Service]
User=centos
Group=centos
WorkingDirectory=/path/to/RecipeApp-Django
ExecStart=/path/to/venv/bin/gunicorn --workers 3 --bind 0.0.0.0:8000 RecipeApp.wsgi:application

[Install]
WantedBy=multi-user.target