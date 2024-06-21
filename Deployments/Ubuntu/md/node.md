# Deploy a Node.js/Express REST API on Ubuntu 24

This guide outlines the steps to deploy a Node.js/Express REST API on an Ubuntu 24 server.

## 1. Update System Packages

sudo apt update

## 2. Install Node.js

curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh

sudo bash nodesource_setup.sh

sudo apt install nodejs -y

## 3. Install Yarn (Optional)

sudo npm install -g yarn

## 4. Clone the Project

git clone https://github.com/GerromeSieger/RecipeApp-Node.git

cd RecipeApp-Node

## 5. Install Dependencies

### Using npm:

npm install

### Or using Yarn:

yarn install

## 6. Set Up Environment File

cp .envEXAMPLE .env

### Edit .env file to configure your database and other settings

## 7. Run the Application

### Using npm:

npm run start

### Or using Yarn:

yarn start

## 8. Set Up as a Systemd Service (Optional)

### Create a service file:

sudo nano /etc/systemd/system/nodejs-api.service

### Add the following content (adjust paths as necessary):

```ini
[Unit]
Description=Node.js API
After=network.target

[Service]
User=ubuntu
WorkingDirectory=/path/to/RecipeApp-Node
ExecStart=/usr/bin/npm start
Restart=always
Environment=NODE_ENV=production

[Install]
WantedBy=multi-user.target