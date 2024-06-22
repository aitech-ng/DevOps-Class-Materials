# Deploy a Static Website on Ubuntu 24 with Nginx

This guide outlines the steps to deploy a static website on an Ubuntu 24 server using Nginx.

## 1. Update System Packages

```bash
sudo apt update
```

## 2. Install Nginx

```bash
sudo apt install nginx -y
```

## 3. Clone the Website Code

```bash
git clone https://github.com/GerromeSieger/Static-Site.git
```

## 4. Deploy the Website
### Copy the cloned content to Nginx's default serving directory:

```bash
sudo cp -r Static-Site/* /var/www/html
```

## 5. Restart Nginx

```bash
sudo systemctl restart nginx
```

## 6. Verify Deployment (Optional)

### Open a web browser and navigate to your server's IP address or domain name. Your static website should now be live and accessible.

## 7. Additional Configuration (Optional)

### To view or modify Nginx's configuration:

```bash
sudo nano /etc/nginx/sites-enabled/default
```