# MongoDB Deployment on Ubuntu 24

This guide outlines the steps to deploy a MongoDB database on an Ubuntu 24 server.

1. Update System Packages

```bash
sudo apt update
```

2. Import MongoDB GPG Key and Add Repository

```bash
wget -nc https://www.mongodb.org/static/pgp/server-6.0.asc
cat server-6.0.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/mongodb.gpg >/dev/null 
sudo sh -c 'echo "deb [ arch=amd64,arm64 signed-by=/etc/apt/keyrings/mongodb.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" >> /etc/apt/sources.list.d/mongo.list'
```

3. Install MongoDB

```bash
sudo apt update
sudo apt install mongodb-org -y
```

4. Start MongoDB Service

```bash
sudo systemctl start mongod
```

5. Create a User with Password

Access the MongoDB shell:

```bash
mongosh
```

Execute the following commands in the MongoDB shell:

```javascript
use recipe
db.createUser({
  user: "admin",
  pwd: "12345",
  roles: [ { role: "readWrite", db: "recipe" } ]
})
exit

```
6. Verify Installation (Optional)

Check the status of the MongoDB service:

```bash
sudo systemctl status mongod
```