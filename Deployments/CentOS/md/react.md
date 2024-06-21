# Deploy a React Site on CentOS with Nginx

This guide outlines the steps to deploy a React site on a CentOS server using Nginx.

## 1. Update System Packages

sudo yum update -y

## 2. Install Node.js

curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -

sudo yum install -y nodejs 

## 3. Install Yarn (Optional)

sudo npm install -g yarn

## 4. Install Git

sudo yum install -y git

## 5. Clone the React Project

git clone https://github.com/GerromeSieger/React-Site.git

cd React-Site

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

## 8. Install Nginx

sudo yum install -y nginx

## 9. Deploy the Built Site

sudo cp -r build/* /usr/share/nginx/html

## 10. Start and Enable Nginx

sudo systemctl start nginx

sudo systemctl enable nginx

## 11. Restart Nginx

sudo systemctl restart nginx

## 12. Verify Deployment

Open a web browser and navigate to your server's IP address or domain name.

Your React site should now be live and accessible.