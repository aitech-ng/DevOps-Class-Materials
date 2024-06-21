# Deploy a MySQL Database on CentOS

This guide outlines the steps to deploy a MySQL database on a CentOS server.

## 1. Update System Packages

sudo yum update -y

## 2. Install MySQL

sudo yum install -y https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm

sudo dnf install -y mysql-community-server 

## 3. Start and Enable MySQL Service

sudo systemctl start mysqld.service

sudo systemctl enable mysqld

## 4. Secure MySQL Installation

sudo mysql_secure_installation

## 5. Access MySQL Shell and Configure Database

sudo mysql -u root -p

### Execute the following SQL commands:

```sql
-- Create the database
CREATE DATABASE recipe;

-- Create the user and set the password
CREATE USER 'admin'@'localhost' IDENTIFIED BY '12345';

-- Grant all privileges to the user for the database
GRANT ALL PRIVILEGES ON recipe.* TO 'admin'@'localhost';

-- List databases (optional)
SHOW DATABASES;

-- Exit MySQL shell
EXIT;