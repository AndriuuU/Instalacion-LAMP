#!/bin/bash

source .env

# Instalar phpMyAdmin
sudo apt install -y phpmyadmin
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

# Instalar Adminer
sudo mkdir -p /var/www/html/adminer
sudo wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/html/adminer/index.php

# Instalar GoAccess
sudo apt install -y goaccess
sudo mkdir -p /var/www/html/stats
sudo goaccess /var/log/apache2/access.log -o /var/www/html/stats/index.html --log-format=COMBINED
