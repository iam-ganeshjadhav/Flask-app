#!/bin/bash
set -e
cd /home/ubuntu/employee-app

if [ ! -d /home/ubuntu/venv ]; then
  sudo apt-get update -y
  sudo apt-get install -y python3-pip python3-venv
  python3 -m venv /home/ubuntu/venv
fi

/home/ubuntu/venv/bin/pip install --upgrade pip
/home/ubuntu/venv/bin/pip install -r requirements.txt

sudo chown -R ubuntu:ubuntu /home/ubuntu/employee-app
sudo cp systemd/employee-app.service /etc/systemd/system/employee-app.service
sudo systemctl daemon-reload
sudo systemctl enable employee-app
