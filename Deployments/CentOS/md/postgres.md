# Deploy a PostgreSQL Database on CentOS

This guide outlines the steps to deploy a PostgreSQL database on a CentOS server.

## 1. Update System Packages

sudo yum update -y

## 2. Install PostgreSQL

sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

sudo yum install -y postgresql14 postgresql14-server

sudo /usr/pgsql-14/bin/postgresql-14-setup initdb

## 3. Start and Enable PostgreSQL Service

sudo systemctl start postgresql-14

sudo systemctl enable postgresql-14

## 4. Verify PostgreSQL Service (Optional)

sudo systemctl status postgresql-14

## 5. Access PostgreSQL Shell and Configure Database

sudo -u postgres psql

### Execute the following SQL commands:

```sql
-- Create the database
CREATE DATABASE recipe;

-- Create the user and set the password
CREATE USER admin WITH ENCRYPTED PASSWORD '12345';

-- Change the database owner to admin
ALTER DATABASE recipe OWNER TO admin;

-- Grant all privileges to the user for the database
GRANT ALL PRIVILEGES ON DATABASE recipe TO admin;

-- List databases (optional)
\l

-- Change password of an existing user (if applicable)
ALTER USER postgres WITH PASSWORD '123456';

-- Exit PostgreSQL shell
\q