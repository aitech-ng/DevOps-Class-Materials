# Deploy a Python/Django REST API on CentOS 9 with Gunicorn

This guide outlines the steps to deploy a Python/Django REST API on a CentOS 9 server using Gunicorn.

1. Update System Packages

```bash
sudo yum update -y
```
2. Install Pip and Install Python virtual environment package with pip

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

9. Open the Firewall

```bash
sudo firewall-cmd --permanent --add-port=8000/tcp
sudo firewall-cmd --reload
```

10. Verify Deployment

Open a web browser and navigate to http://publicip:8000/swagger to access the swagger documentation.

## Alternative Deployment Strategy (Using Systemd)

11. Create Gunicorn Service File

```bash
sudo nano /etc/systemd/system/gunicorn.service
```

Add the following content (adjust paths as necessary):

```ini
[Unit]
Description=Gunicorn daemon for Django API
After=network.target

[Service]
User=root
Group=root
WorkingDirectory=/root/RecipeApp-Django
Environment="PATH=/root/venv/bin"
ExecStart=/root/venv/bin/python3 manage.py runserver 0.0.0.0:8000

[Install]
WantedBy=multi-user.target
```
12. Reload Daemon, Start and Enable gunicorn Service

```bash
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
sudo systemctl status gunicorn
```