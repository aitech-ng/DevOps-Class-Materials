#!/bin/bash

sudo apt update

curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh

sudo bash nodesource_setup.sh

sudo apt install nginx nodejs -y

git clone https://github.com/GerromeSieger/RecipeApp-Node.git

cd RecipeApp-Node

cp .envEXAMPLE .env

npm install

npm start