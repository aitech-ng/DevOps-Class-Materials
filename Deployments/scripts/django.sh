#!/bin/bash

sudo apt update

sudo apt install python3-pip -y

sudo pip install virtualenv

python3 -m virtualenv venv

source venv/bin/activate

git clone https://github.com/GerromeSieger/RecipeApp-Django.git

cd RecipeApp-Django

pip install -r requirements.txt

python manage.py migrate

gunicorn --bind 0.0.0.0:8000 RecipeApp.wsgi:application