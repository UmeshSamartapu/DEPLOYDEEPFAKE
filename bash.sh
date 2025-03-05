#!/usr/bin/env bash
set -o errexit

# Install system packages
apt-get update && apt-get install -y ffmpeg libsm6 libxext6 libgl1

pip install -r requirements.txt

python manage.py collectstatic --noinput
python manage.py migrate