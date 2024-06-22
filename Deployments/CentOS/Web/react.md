# Deploy a React Site on CentOS 9 with Nginx

This guide outlines the steps to deploy a React site on a CentOS 9 server using Nginx.

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

5. Clone the React Project

```bash
git clone https://github.com/GerromeSieger/React-Site.git
cd React-Site
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

8. Install Nginx

```bash
sudo yum install -y nginx
```

9. Deploy the Built Site

```bash
sudo cp -r build/* /usr/share/nginx/html
```

10. Restart Nginx

```bash
sudo systemctl restart nginx
```

11. Verify Deployment

Open a web browser and navigate to your server's IP address or domain name. Your React site should now be live and accessible.