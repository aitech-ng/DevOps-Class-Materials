# Deploy a PHP/Laravel REST API on Ubuntu 24

This guide outlines the steps to deploy a PHP/Laravel REST API on an Ubuntu 24 server.

## 1. Update System Packages

sudo apt update

## 2. Add PHP Repository

LC_ALL=C.UTF-8 sudo add-apt-repository ppa:ondrej/php

## 3. Install PHP and Required Extensions

sudo apt install php8.2 php8.2-dom php8.2-mysql php8.2-curl php-zip unzip -y

## 4. Install Composer

curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php

HASH=`curl -sS https://composer.github.io/installer.sig`

sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

## 5. Install Laravel Installer

composer global require laravel/installer

## 6. Clone the Project

git clone https://github.com/GerromeSieger/RecipeApp-Laravel.git

cd RecipeApp-Laravel

## 7. Install Dependencies

composer install

## 8. Set Up Environment File

cp .env.example .env

### Edit .env file to configure your database and other settings

## 9. Run Migrations

php artisan migrate:fresh

## 10. Run the Application

php artisan serve --host=0.0.0.0 --port=8080

## 11. Set Up as a Systemd Service (Optional)

### Create a service file:

sudo nano /etc/systemd/system/laravel-api.service

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