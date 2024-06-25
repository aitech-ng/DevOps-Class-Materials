#!/bin/bash

python3 manage.py migrate

gunicorn -b 0.0.0.0:8000 -w 3 RecipeApp.wsgi:application
