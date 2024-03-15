#!/bin/bash

sudo apt update

sudo apt install postgresql -y

sudo -u postgres psql <<EOF

CREATE DATABASE recipe;

CREATE USER admin WITH ENCRYPTED PASSWORD '12345';

GRANT ALL PRIVILEGES ON DATABASE recipe TO admin;

EOF