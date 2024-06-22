# Deploy a PHP/Laravel REST API on Ubuntu 24

This guide outlines the steps to deploy a PHP/Laravel REST API on an Ubuntu 24 server.

## 1. Update System Packages

```bash
sudo apt update
```

## 2. Add PHP Repository

```bash
LC_ALL=C.UTF-8 sudo add-apt-repository ppa:ondrej/php
```

## 3. Install PHP and Required Extensions

```bash
sudo apt install php8.2 php8.2-dom php8.2-mysql php8.2-curl php-zip unzip -y
```

## 4. Install Composer

```bash
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

## 5. Install Laravel Installer

```bash
composer global require laravel/installer
```

## 6. Clone the Project

```bash
git clone https://github.com/GerromeSieger/RecipeApp-Laravel.git
cd RecipeApp-Laravel
```

## 7. Install Dependencies

```bash
composer install
```

## 8. Set Up Environment File

```bash
cp .env.example .env
```

### Edit .env file to configure your database and other settings

## 9. Run Migrations

```bash
php artisan migrate:fresh
```

## 10. Run the Application

```bash
php artisan serve --host=0.0.0.0 --port=8080
```

## 11. Verify Deployment

### Open a web browser and navigate to http://publicip:8080/api/documentation to access the swagger documentation.

## Alternative Deployment Strategy (Using Systemd)

## 12. Set Up as a Systemd Service

### Create a service file:

```bash
sudo nano /etc/systemd/system/laravel-api.service
```

### Add the following content (adjust paths as necessary):

```ini
[Unit]
Description=Laravel API
After=network.target

[Service]
User=www-data
Group=www-data
WorkingDirectory=/path/to/RecipeApp-Laravel
ExecStart=/usr/bin/php artisan serve --host=0.0.0.0 --port=8080
Restart=always

[Install]
WantedBy=multi-user.target

```

## 13. Reload Daemon, Start and Enable laravel-api Service

```bash
sudo systemctl daemon-reload
sudo systemctl start laravel-api
sudo systemctl enable laravel-api
```