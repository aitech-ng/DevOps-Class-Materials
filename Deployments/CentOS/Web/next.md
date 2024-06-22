# Deploy a Next.js Site on CentOS 9 with Nginx

This guide outlines the steps to deploy a Next.js site on a CentOS 9 server using Nginx.

1. Update System Packages

```bash
sudo yum update -y
```

2. Install Node.js

```bash
curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs 
```

3. Install Yarn (Optional)

```bash
sudo npm install -g yarn
```

4. Install Git

```bash
sudo yum install -y git
```

5. Clone the Next.js Project

```bash
git clone https://github.com/GerromeSieger/Nextjs-Site.git
cd Nextjs-Site
```

6. Install Dependencies

Using npm:

```bash
npm install
```

Or using Yarn:

```bash
yarn install
```

7. Build the Project

Using npm:

```bash
npm run build
```

Or using Yarn:

```bash
yarn build
```

8. Start the Next.js Application

Using npm:

```bash
npm run start
```

Or using Yarn:

```bash
yarn start
```

9. Install and Configure Nginx as a Reverse Proxy

```bash
sudo yum install -y nginx
sudo nano /etc/nginx/nginx.conf
```

Add the following server block inside the http block:

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
```

10. Verify Deployment

Open a web browser and navigate to your server's IP address or domain name. Your Nextjs site should now be live and accessible.