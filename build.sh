# build.sh
#!/usr/bin/env bash
set -o errexit

# Upgrade pip to the latest version
pip install --upgrade pip

# Install system dependencies
apt-get update && apt-get install -y ffmpeg libsm6 libxext6 libgl1

pip install -r requirements.txt
python manage.py collectstatic --noinput
python manage.py migrate

export MAKEFLAGS="-j2"  # Reduce parallel jobs to 2
export DLIB_USE_CUDA=0  # Disable CUDA if not required