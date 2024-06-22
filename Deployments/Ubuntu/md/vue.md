# Deploy a Vue.js Site on Ubuntu 24 with Nginx

This guide outlines the steps to deploy a Vue.js site on an Ubuntu 24 server using Nginx.

## 1. Update System Packages

```bash
sudo apt update
```

## 2. Install Node.js

```bash
curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs -y
```

## 3. Install Nginx

```bash
sudo apt install nginx -y
```

## 4. Install Yarn (Optional)

```bash
sudo npm install -g yarn
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

## 8. Deploy the Built Site

```bash
sudo cp -r dist/* /var/www/html
```

## 9. Restart Nginx

```bash
sudo systemctl restart nginx
```

## 10. Verify Deployment

### Open a web browser and navigate to your server's IP address or domain name Your Vue.js site should now be live and accessible.
