# Deploy a Static Website on Ubuntu 24 with Nginx

This guide outlines the steps to deploy a static website on an Ubuntu 24 server using Nginx.

## 1. Update System Packages

sudo apt update

## 2. Install Nginx

sudo apt install nginx -y

## 3. Clone the Website Code

git clone https://github.com/GerromeSieger/Static-Site.git

## 4. Deploy the Website
### Copy the cloned content to Nginx's default serving directory:

sudo cp -r Static-Site/* /var/www/html

## 5. Restart Nginx

sudo systemctl restart nginx

## 6. Verify Deployment (Optional)

### Open a web browser and navigate to your server's IP address or domain name.

### Additional Configuration (Optional)

### To view or modify Nginx's configuration:

sudo nano /etc/nginx/sites-enabled/default

## Your static website should now be live and accessible.
