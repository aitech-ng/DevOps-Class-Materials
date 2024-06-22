# Deploy a Static Website on CentOS 9 with Nginx

This guide outlines the steps to deploy a static website on a CentOS 9 server using Nginx.

1. Update System Packages

```bash
sudo yum update -y
```

2. Install Nginx

```bash
sudo yum install -y nginx
```

3. Install Git

```bash
sudo yum install -y git
```

4. Clone the Website Code

```bash
git clone https://github.com/GerromeSieger/Static-Site.git
```

5. Deploy the Website

```bash
sudo cp -r Static-Site/* /usr/share/nginx/html
```

6. Restart Nginx

```bash
sudo systemctl restart nginx
```

7. Verify Deployment

Open a web browser and navigate to your server's IP address or domain name. Your static website should now be live and accessible.

8. Additional Configuration (Optional)

To view or modify Nginx's configuration:

```bash
sudo nano /etc/nginx/nginx.conf
```