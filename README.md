# Práctica: Administración de WordPress con WP-CLI

## Descripción
Este repositorio contiene un proyecto para la instalación y administración de un sitio WordPress mediante WP-CLI.

## Pasos de Instalación
1. **Instalar la Pila LAMP**:
    Ejecutar `install_lamp.sh` para instalar Apache, MySQL y PHP.

2. **Instalar y Configurar WP-CLI**:
    Descarga WP-CLI e instala WordPress con el script `deploy_wordpress_with_wpcli.sh`.

3. **Configurar HTTPS con Let’s Encrypt**:
    Ejecuta `setup_letsencrypt_https.sh` para obtener un certificado SSL gratuito y configurar HTTPS.

## Scripts de Bash
- **install_lamp.sh**: Automatiza la instalación de la pila LAMP.
- **deploy_wordpress_with_wpcli.sh**: Configura la base de datos e instala WordPress usando WP-CLI.
- **setup_letsencrypt_https.sh**: Configura HTTPS para el dominio WordPress.

## Variables de Entorno
Definidas en `.env` para almacenar configuraciones reutilizables.
