# Deploy a Next.js Site on Ubuntu 24 with Nginx

This guide outlines the steps to deploy a Next.js site on an Ubuntu 24 server using Nginx.

1. Update System Packages

```bash
sudo apt update
```

2. Install Node.js

```bash
curl -sL https://deb.nodesource.com/setup_18.x | sudo bash -
sudo apt install nodejs -y
```

3. Install Nginx

```bash
sudo apt install nginx -y
```

4. Install Yarn (Optional)

```bash
sudo npm install -g yarn
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

9. Configure Nginx as a Reverse Proxy

```bash
sudo nano /etc/nginx/sites-enabled/default
```

Add the following configuration (replace `your_domain.com` with your actual domain):

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