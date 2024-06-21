#!/bin/bash

sudo apt update

sudo apt install nginx -y

git clone https://github.com/GerromeSieger/Static-Site.git

sudo cp -r Static-Site/* /var/www/html

sudo systemctl restart nginx