# scripts/install_lamp.sh
#!/bin/bash

# Actualización e instalación de paquetes LAMP
sudo apt update && sudo apt install -y apache2 mysql-server php php-mysql libapache2-mod-php

# Configuración de MySQL
sudo mysql_secure_installation

# Reiniciar servicios
sudo systemctl restart apache2
sudo systemctl restart mysql
