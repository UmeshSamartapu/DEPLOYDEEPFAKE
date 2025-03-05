# start.sh
#!/usr/bin/env bash
set -o errexit

python manage.py migrate
gunicorn DeepFakeProject.wsgi --bind 0.0.0.0:10000 --log-file -
gunicorn DeepFakeProject.wsgi --preload --bind 0.0.0.0:10000