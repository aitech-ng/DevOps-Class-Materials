# Deploy a Node.js/Express REST API on CentOS 9

This guide outlines the steps to deploy a Node.js/Express REST API on a CentOS 0 server.

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

4. Clone the Project

```bash
git clone https://github.com/GerromeSieger/RecipeApp-Node.git
cd RecipeApp-Node
```

5. Install Dependencies

Using npm:

```bash
npm install
```

Or using Yarn:

```bash
yarn install
```

6. Set Up Environment File

```bash
cp .envEXAMPLE .env
```

Edit .env file to configure your database and other settings

7. Run the Application

Using npm:

```bash
npm run start
```

Or using Yarn:

```bash
yarn start
```

8. Open the Firewall

```bash
sudo firewall-cmd --permanent --add-port=5000/tcp
sudo firewall-cmd --reload
```

9. Verify Deployment

Open a web browser and navigate to http://publicip:5000/docs to access the swagger documentation.

## Alternative Deployment Strategy (Using Systemd)

10. Set Up as a Systemd Service

Create a service file:

```bash
sudo nano /etc/systemd/system/nodejs-api.service
```

Add the following content (adjust paths as necessary):

```ini
[Unit]
Description=Node.js API
After=network.target

[Service]
User=root
WorkingDirectory=/root/RecipeApp-Node
ExecStart=/usr/bin/npm start
Restart=always

[Install]
WantedBy=multi-user.target
```
11. Reload Daemon, Start and Enable nodejs-api Service

```bash
sudo systemctl daemon-reload
sudo systemctl start nodejs-api
sudo systemctl enable nodejs-api
sudo systemctl status nodejs-api
```