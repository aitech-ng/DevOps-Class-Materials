# MySQL Deployment on Ubuntu 24

This guide outlines the steps to deploy a MySQL database on an Ubuntu 24 server.

## 1. Update System Packages

```bash
sudo apt update
```

## 2. Install MySQL

```bash
sudo apt install mysql-server -y
```

## 3. Verify MySQL Service (Optional)

```bash
sudo systemctl status mysql
```

## 4. Access MySQL Shell and Configure Database

```bash
sudo mysql -u root -h localhost
```

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
 ```

## 5. Configure for External Access (Optional)


## If you need to access the database externally or from a container:

### Edit MySQL configuration:

```bash
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```

### Change the bind address to:

```bind-address = 0.0.0.0```

### Save and exit the editor.

## Access MySQL shell again:

```bash
sudo mysql -u root -h localhost
```

### Create a user for external access:

```sql

-- Create the user and set the password
CREATE USER 'admin'@'<publicIP>' IDENTIFIED BY '12345'

-- Grant all privileges to the user for the database
GRANT ALL PRIVILEGES ON recipe.* TO 'admin'@'<publicIP>';

-- List databases (optional)
SHOW DATABASES;

-- Exit MySQL shell
EXIT; 
 ```
### Replace <publicIP> with your server's public IP address.

## 6. Restart MySQL Service

```bash
sudo systemctl restart mysql
```