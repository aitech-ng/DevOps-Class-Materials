# Deploy a Vue.js Site on CentOS 9 with Nginx

This guide outlines the steps to deploy a Vue.js site on a CentOS 9 server using Nginx.

## 1. Update System Packages

```bash
sudo yum update -y
```

## 2. Install Node.js

```bash
curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs
```

## 3. Install Yarn (Optional)

```bash
sudo npm install -g yarn
```

## 4. Install Git

```bash
sudo yum install -y git
```

## 5. Clone the Vue.js Project

```bash
git clone https://github.com/GerromeSieger/Vuejs-Site.git
cd Vuejs-Site
```

## 6. Install Dependencies

### Using npm:

```bash
npm install
```

### Or using Yarn:

```bash
yarn install
```

## 7. Build the Project

### Using npm:

```bash
npm run build
```

### Or using Yarn:

```bash
yarn build
```

## 8. Install Nginx

```bash
sudo yum install -y nginx
```

## 9. Deploy the Built Site

```bash
sudo cp -r dist/* /usr/share/nginx/html
```

## 10. Restart Nginx

```bash
sudo systemctl restart nginx
```

## 11. Verify Deployment

### Open a web browser and navigate to your server's IP address or domain name Your Vue.js site should now be live and accessible.