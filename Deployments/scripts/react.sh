#!/bin/bash

sudo apt update

curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh

sudo bash nodesource_setup.sh

sudo apt install nginx nodejs -y

git clone https://github.com/GerromeSieger/React-Site.git

cd React-Site

npm install

npm run build

sudo cp -r build/* /var/www/html

sudo systemctl restart nginx