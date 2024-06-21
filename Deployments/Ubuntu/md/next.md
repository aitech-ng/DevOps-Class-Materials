# Deploy a Next.js Site on Ubuntu 24 with Nginx

This guide outlines the steps to deploy a Next.js site on an Ubuntu 24 server using Nginx.

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

## 5. Clone the Next.js Project

git clone https://github.com/GerromeSieger/Nextjs-Site.git

cd Nextjs-Site

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

## 8. Start the Next.js Application

### Using npm:

npm run start

### Or using Yarn:

yarn start

## 9. Configure Nginx as a Reverse Proxy

sudo nano /etc/nginx/sites-enabled/default

### Add the following configuration (replace `your_domain.com` with your actual domain):

```nginx
server {
    listen 80;
    server_name your_domain.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}