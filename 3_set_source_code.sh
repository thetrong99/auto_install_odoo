#!/bin/bash


pyenv install 3.6.9
sleep 1
cd /opt/tsm-backend
pyenv virtualenv 3.6.9 backend-env
pyenv local backend-env
pip install --upgrade pip && pip install -r odoo12/requirements.txt
echo "-------------Done Source------------"
sshpass -p "nhincaigi@123a" ssh -o StrictHostKeyChecking=no root@192.168.44.139 "sh ~/auto_install_odoo/4_config_odoo.sh"
