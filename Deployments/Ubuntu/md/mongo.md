# MongoDB Deployment on Ubuntu 24

This guide outlines the steps to deploy a MongoDB database on an Ubuntu 24 server.

## 1. Update System Packages


sudo apt update

## 2. Import MongoDB GPG Key and Add Repository

wget -nc https://www.mongodb.org/static/pgp/server-6.0.asc

cat server-6.0.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/mongodb.gpg >/dev/null 

sudo sh -c 'echo "deb [ arch=amd64,arm64 signed-by=/etc/apt/keyrings/mongodb.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" >> /etc/apt/sources.list.d/mongo.list'

## 3. Install MongoDB

sudo apt update

sudo apt install mongodb-org -y

## 4. Start MongoDB Service

sudo systemctl start mongod

## 5. Create a User with Password

### Access the MongoDB shell:

mongosh

### Create a user with read and write privileges:

use recipe

db.createUser({

  user: "admin",

  pwd: "12345",

  roles: [ { role: "readWrite", db: "recipe" } ]

})

### Exit the MongoDB shell by typing exit.

## 6. Verify Installation (Optional)

### Check the status of the MongoDB service:

sudo systemctl status mongod