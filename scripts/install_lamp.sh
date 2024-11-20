#!/bin/bash

source .env

# Actualizar repositorios
sudo apt update -y

# Instalar Apache
sudo apt install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2

# Instalar MySQL
sudo apt install -y mysql-server
sudo systemctl enable mysql
sudo systemctl start mysql

# Configurar MySQL
sudo mysql -e "CREATE USER '${APP_USER}'@'localhost' IDENTIFIED BY '${APP_PASSWORD}';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${APP_USER}'@'localhost' WITH GRANT OPTION;"
sudo mysql -e "FLUSH PRIVILEGES;"

# Instalar PHP
sudo apt install -y php libapache2-mod-php php-mysql php-cli php-curl php-gd php-mbstring

# Reiniciar Apache
sudo systemctl restart apache2
