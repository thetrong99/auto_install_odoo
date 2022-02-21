#!/bin/bash
mv ~/auto_install_odoo/tsm-backend.conf /etc/
mv ~/auto_install_odoo/backend.service /etc/systemd/system/

# create file log
mkdir /var/log/backend
touch /var/log/backend/tsm-backend.log
sudo chown -R tsm: /var/log/backend/

systemctl daemon-reload
systemctl start backend
systemctl enable backend

# install nginx
sudo yum install -y epel-release
sudo yum install -y nginx

systemctl start nginx
systemctl enable nginx
# reverse proxy
mv ~/auto_install_odoo/tsm_od.conf /etc/nginx/conf.d/
systemctl restart nginx

firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload

echo "--------------DONE ALL-----------"