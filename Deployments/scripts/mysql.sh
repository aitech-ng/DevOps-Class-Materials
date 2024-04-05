#!/bin/bash

sudo apt update

sudo apt install mysql-server -y

sudo mysql -u root -h localhost <<EOF

CREATE DATABASE recipe;

CREATE USER 'admin'@'localhost' IDENTIFIED BY '12345';

GRANT ALL PRIVILEGES ON recipe.* TO 'admin'@'localhost';

EOF