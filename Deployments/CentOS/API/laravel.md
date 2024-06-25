# Deploy a PHP/Laravel REST API on CentOS 9

This guide outlines the steps to deploy a PHP/Laravel REST API on a CentOS 9 server.

1. Update System Packages

```bash
sudo yum update -y
```

2. Install EPEL Repository

```bash
sudo yum install epel-release -y
```

3. Install Remi Repository

```bash
sudo yum install http://rpms.remirepo.net/enterprise/remi-release-$(rpm -E %rhel).rpm -y
```

4. Install Yum Utils

```bash
sudo yum install yum-utils -y
```

5. Disable Default PHP Module

```bash
sudo yum module reset php -y
sudo yum module disable php -y
```

6. Enable Remi Repository for PHP 8.2

```bash
sudo yum module enable php:remi-8.2 -y
```

7. Install PHP 8.2 and Required Extensions

```bash
sudo yum install php php-cli php-common php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json php-dom -y
```

8. Install Composer

```bash
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer
```

9. Install Laravel Installer

```bash
composer global require laravel/installer
```

10. Install Git (if not already installed)

```bash
sudo yum install git -y
```

11. Clone the Project

```bash
git clone https://github.com/GerromeSieger/RecipeApp-Laravel.git
cd RecipeApp-Laravel
```

12. Install Dependencies

```bash
composer install
```

13. Set Up Environment File

```bash
cp .env.example .env
```

Edit .env file to configure your database and other settings

14. Run Migrations

```bash
php artisan migrate:fresh
```

15. Run the Application

```bash
php artisan serve --host=0.0.0.0 --port=8080
```

16. Open the Firewall

```bash
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
```

17. Verify Deployment

Open a web browser and navigate to http://publicip:8080/api/documentation to access the swagger documentation.

## Alternative Deployment Strategy (Using Systemd)

18. Set Up as a Systemd Service

Create a service file:

``` bash
sudo nano /etc/systemd/system/laravel-api.service
```

Add the following content (adjust paths as necessary):

```ini
[Unit]
Description=Laravel API
After=network.target

[Service]
User=root
Group=root
WorkingDirectory=/root/RecipeApp-Laravel
ExecStart=/usr/bin/php artisan serve --host=0.0.0.0 --port=8080
Restart=always

[Install]
WantedBy=multi-user.target
```

19. Reload Daemon, Start and Enable laravel-api Service

``` bash
sudo systemctl daemon-reload
sudo systemctl start laravel-api
sudo systemctl enable laravel-api
sudo systemctl status laravel-api
```