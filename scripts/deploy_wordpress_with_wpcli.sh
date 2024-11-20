# scripts/deploy_wordpress_with_wpcli.sh
#!/bin/bash

# Cargar las variables de entorno
source .env

# Instalar WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

# Crear la base de datos y el usuario en MySQL
sudo mysql -u root -p <<MYSQL_SCRIPT
CREATE DATABASE ${DB_NAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${DB_USER}'@'${DB_HOST}' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'${DB_HOST}';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

# Descargar el código fuente de WordPress
sudo mkdir -p /var/www/html
cd /var/www/html
wp core download --locale=${WP_LOCALE} --allow-root

# Crear el archivo de configuración wp-config.php
wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=${DB_HOST} --path=/var/www/html --allow-root

# Instalar WordPress
wp core install \
  --url=${WP_URL} \
  --title="${WP_TITLE}" \
  --admin_user=${WP_ADMIN_USER} \
  --admin_password=${WP_ADMIN_PASS} \
  --admin_email=${WP_ADMIN_EMAIL} \
  --path=/var/www/html \
  --allow-root

# Configurar los enlaces permanentes
wp rewrite structure '/%postname%/' --path=/var/www/html --allow-root

# Asignar permisos
sudo chown -R www-data:www-data /var/www/html
