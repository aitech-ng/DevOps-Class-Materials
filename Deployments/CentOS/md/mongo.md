# Deploy a MongoDB Database on CentOS

This guide outlines the steps to deploy a MongoDB database on a CentOS server.

## 1. Update System Packages

sudo yum update -y

## 2. Create MongoDB Repository File

sudo tee /etc/yum.repos.d/mongodb-org-6.0.repo << EOF
[mongodb-org-6.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/6.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-6.0.asc
EOF

## 3. Install MongoDB

sudo yum install -y mongodb-org

## 4. Start and Enable MongoDB Service

sudo systemctl start mongod
sudo systemctl enable mongod

## 5. Verify MongoDB Service (Optional)

sudo systemctl status mongod

## 6. Create a User with Password

mongosh

### Execute the following commands in the MongoDB shell:

```javascript
use recipe
db.createUser({
  user: "admin",
  pwd: "12345",
  roles: [ { role: "readWrite", db: "recipe" } ]
})
exit