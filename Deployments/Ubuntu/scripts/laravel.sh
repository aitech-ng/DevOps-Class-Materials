#!/bin/bash

sudo apt update

LC_ALL=C.UTF-8 sudo add-apt-repository ppa:ondrej/php -y

sudo apt install php8.2 php8.2-dom php8.2-mysql php8.2-curl php-zip unzip -y

curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php

HASH=`curl -sS https://composer.github.io/installer.sig`

sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

composer global require laravel/installer

git clone https://github.com/GerromeSieger/RecipeApp-Laravel.git

cd RecipeApp-Laravel

composer install

cp .env.example .env

php artisan migrate:fresh

php artisan serve --host=0.0.0.0 --port=8080