# Deploy a React Site on Ubuntu 24 with Nginx

This guide outlines the steps to deploy a React site on an Ubuntu 24 server using Nginx.

## 1. Update System Packages

sudo apt update

## 2. Install Node.js

curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh

sudo bash nodesource_setup.sh

sudo apt install nodejs -y

## 3. Install Nginx

sudo apt install nginx -y

## 4. Install Yarn (Optional)

sudo npm install -g yarn

## 5. Clone the React Project

git clone https://github.com/GerromeSieger/React-Site.git

cd React-Site

## 6. Install Dependencies

### Using npm:

npm install

### Or using Yarn:

yarn install

## 7. Build the Project

### Using npm:

npm run build

### Or using Yarn:

yarn build

## 8. Deploy the Built Site

sudo cp -r build/* /var/www/html

## 9. Restart Nginx

sudo systemctl restart nginx

## 10. Verify Deployment

### Open a web browser and navigate to your server's IP address or domain name. Your React site should now be live and accessible.