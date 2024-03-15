#!/bin/bash

sudo apt update

wget -nc https://www.mongodb.org/static/pgp/server-6.0.asc

cat server-6.0.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/mongodb.gpg >/dev/null

sudo sh -c 'echo "deb [ arch=amd64,arm64 signed-by=/etc/apt/keyrings/mongodb.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" >> /etc/apt/sources.list.d/mongo.list'

sudo apt update

sudo apt install mongodb-org -y

sudo systemctl start mongod

mongosh --eval "
db.createUser({
  user: 'admin',
  pwd: '12345',
  roles: [{ role: 'readWrite', db: 'recipe' }]
});"