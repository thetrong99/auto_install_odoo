#!/bin/bash

#cai cac goi can thiet
echo 'tsm    ALL=(ALL)       ALL' >> /etc/sudoers
sudo yum install -y gcc git wget libxslt-devel bzip2-devel openldap-devel libjpeg-devel freetype-devel unzip
sudo yum install -y python3-devel readline-devel openssl-devel libffi-devel make sqlite-devel sshpass

#tao tep de luu source code
cd /tmp
#git clone https://github.com/thetrong99/auto_install_odoo.git
mv ~/auto_install_odoo/setup_env.sh /home/tsm
chown tsm.tsm /home/tsm/setup_env.sh
mkdir -p /opt/tsm-backend
chown tsm.tsm /opt/tsm-backend
unzip ~/odoo12.zip -d /opt/tsm-backend/

sed -i 's/idna==2.9/idna==2.7/' /opt/tsm-backend/odoo12/requirements.txt
sed -i 's/urllib3==1.25.8/urllib3==1.24/' /opt/tsm-backend/odoo12/requirements.txt

sleep 3


#sshpass -p "trong@10" ssh tsm@192.168.44.139 sh auto_install_odoo/setup_env.sh
#sleep 3
# install wkhtmltopdf
wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.1/wkhtmltox-0.12.1_linux-centos7-amd64.rpm

yum localinstall -y wkhtmltox-0.12.1_linux-centos7-amd64.rpm

# install PostgreSQL 13
sudo yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo yum -y install postgresql13 postgresql13-server
sleep 1
sudo /usr/pgsql-13/bin/postgresql-13-setup initdb
sudo systemctl start postgresql-13

# Create user for odoo
#su - postgres
#psql
#create user tsm with encrypted password 'tsm123';
#alter user tsm createdb;
#\q
#exit

# create file config odoo
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





