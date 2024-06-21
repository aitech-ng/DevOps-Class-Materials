#!/bin/bash

sudo apt update

curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh

sudo bash nodesource_setup.sh

sudo apt install nginx nodejs -y

git clone https://github.com/GerromeSieger/Nextjs-Site.git

cd Nextjs-Site

npm install

npm run build

npm start