# Deploy a Python/Django REST API on CentOS 9 with Gunicorn

This guide outlines the steps to deploy a Python/Django REST API on a CentOS 9 server using Gunicorn.

1. Update System Packages

```bash
sudo yum update -y
```
2. Install Python and Development Tools and Install virtual environment package with pip

```bash
sudo yum install python3-pip -y
pip install virtualenv
```

3. Create and Activate Virtual Environment

```bash
python3 -m venv venv
source venv/bin/activate
```

4. Clone the Project

```bash
git clone https://github.com/GerromeSieger/RecipeApp-Django.git
cd RecipeApp-Django
```

5. Install Dependencies

```bash
pip install -r requirements.txt
```

6. Configure Database

Ensure your database connection is properly configured in the Django settings

7. Run Migrations

```bash
python manage.py migrate
```

8. Run Application with Gunicorn

```bash
gunicorn --bind 0.0.0.0:8000 RecipeApp.wsgi:application
```

9. Verify Deployment

Open a web browser and navigate to http://publicip:8000/swagger to access the swagger documentation.

## Alternative Deployment Strategy (Using Systemd)

10. Create Gunicorn Service File

```bash
sudo nano /etc/systemd/system/gunicorn.service
```

Add the following content (adjust paths as necessary):

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

```
11. Reload Daemon, Start and Enable gunicorn Service

```bash
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
```