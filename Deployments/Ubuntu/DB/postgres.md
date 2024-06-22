# PostgreSQL Deployment on Ubuntu 24

This guide outlines the steps to deploy a PostgreSQL database on an Ubuntu 24 server.

1. Update System Packages

```bash
sudo apt update
```

2. Install PostgreSQL

```bash
sudo apt install postgresql -y
```

3. Verify PostgreSQL Service (Optional)

```bash
sudo systemctl status postgresql
```

4. Access PostgreSQL Shell and Configure Database

```bash
sudo -u postgres psql
```

Execute the following SQL commands:

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

```