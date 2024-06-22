# Deploy a MySQL Database on CentOS 9

This guide outlines the steps to deploy a MySQL database on a CentOS 9 server.

1. Update System Packages

```bash
sudo yum update -y
```

2. Install MySQL

```bash
sudo yum install -y https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
sudo dnf install -y mysql-community-server 
```

3. Start and Enable MySQL Service

```bash
sudo systemctl start mysqld.service
sudo systemctl enable mysqld
```

4. Secure MySQL Installation

```bash
sudo mysql_secure_installation
```

5. Access MySQL Shell and Configure Database

```bash
sudo mysql -u root -p
```

Execute the following SQL commands:

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

```

Replace <publicIP> with your server's public IP address.

6. Restart MySQL Service

```bash
sudo systemctl restart mysql
```