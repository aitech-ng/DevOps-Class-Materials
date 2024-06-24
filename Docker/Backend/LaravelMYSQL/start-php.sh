#!/bin/bash

if [ ! -f "vendor/autoload.php" ]; then
    composer install --no-progress --no-interaction
fi


php artisan cache:clear

php artisan migrate:fresh

php artisan serve --host=0.0.0.0 --port=8080