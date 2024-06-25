# Deploy a MySQL Database on CentOS 9

This guide outlines the steps to deploy a MySQL database on a CentOS 9 server.

1. Update System Packages

```bash
sudo yum update -y
```

2. Install MySQL

```bash
sudo yum install -y https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
sudo yum update -y
sudo yum install -y mysql-community-server 
```

3. Grab Temporary Root Password

```bash
sudo grep 'temporary password' /var/log/mysqld.log
```

4. Start and Enable MySQL Service

```bash
sudo systemctl start mysqld.service
sudo systemctl enable mysqld
```

5. Secure MySQL Installation

```bash
sudo mysql_secure_installation
```

6. Access MySQL Shell and Configure Database

```bash
sudo mysql -u root -p
```

Execute the following SQL commands:

```sql
-- Create the database
CREATE DATABASE recipe;

-- Create the user and set the password
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'passWORD727g1!';

-- Grant all privileges to the user for the database
GRANT ALL PRIVILEGES ON recipe.* TO 'admin'@'localhost';

-- List databases (optional)
SHOW DATABASES;

-- Exit MySQL shell
EXIT;

```

Replace <publicIP> with your server's public IP address.

7. Restart MySQL Service

```bash
sudo systemctl restart mysqld
```

8. You can also change the root password with this SQL command

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'YourNewPassword';
```