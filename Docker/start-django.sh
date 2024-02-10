#!/bin/bash

python3 manage.py makemigrations recipe && python3 manage.py makemigrations users

python3 manage.py migrate recipe && python3 manage.py migrate users

gunicorn -b 0.0.0.0:8000 -w 3 RecipeApp.wsgi:application
