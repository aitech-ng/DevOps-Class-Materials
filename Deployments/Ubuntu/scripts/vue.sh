#!/bin/bash

sudo apt update

curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh

sudo bash nodesource_setup.sh

sudo apt install nginx nodejs -y

git clone https://github.com/GerromeSieger/Vuejs-Site.git

cd Vuejs-Site

npm install

npm run build

sudo cp -r dist/* /var/www/html

sudo systemctl restart nginx