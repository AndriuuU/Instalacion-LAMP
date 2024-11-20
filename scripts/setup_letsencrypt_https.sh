# scripts/setup_letsencrypt_https.sh
#!/bin/bash

# Instalación de Certbot para Let's Encrypt
sudo apt update && sudo apt install -y certbot python3-certbot-apache

# Solicitar el certificado SSL
sudo certbot --apache -d "$WP_URL" --non-interactive --agree-tos -m "$WP_ADMIN_EMAIL"

# Renovación automática del certificado
echo "0 3 * * * /usr/bin/certbot renew --quiet" | sudo tee -a /etc/crontab > /dev/null
