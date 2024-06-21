# Deploy a Static Website on CentOS with Nginx

This guide outlines the steps to deploy a static website on a CentOS server using Nginx.

## 1. Update System Packages

sudo yum update -y

## 2. Install Nginx

sudo yum install -y nginx

## 3. Install Git

sudo yum install -y git

## 4. Clone the Website Code

git clone https://github.com/GerromeSieger/Static-Site.git

## 5. Deploy the Website

sudo cp -r Static-Site/* /usr/share/nginx/html

## 6. Start and Enable Nginx

sudo systemctl start nginx

sudo systemctl enable nginx

## 7. Restart Nginx

sudo systemctl restart nginx

## 9. Verify Deployment

Open a web browser and navigate to your server's IP address or domain name.

## Additional Configuration (Optional)

To view or modify Nginx's configuration:

sudo nano /etc/nginx/nginx.conf

Your static website should now be live and accessible.