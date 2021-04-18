#!/bin/sh

set -e

python manage.py collectstatic --noinput

python manage.py makemigrations --noinput 
python manage.py migrate --noinput 

gunicorn sassy.wsgi:application --bind 0.0.0.0:8000 --workers 4 --threads 4
