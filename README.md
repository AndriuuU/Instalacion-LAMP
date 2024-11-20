# Instalación de la Pila LAMP en Ubuntu Server

Este tutorial describe cómo instalar una pila LAMP (Linux, Apache, MySQL y PHP) junto con herramientas adicionales (phpMyAdmin, Adminer y GoAccess) en una máquina virtual con Ubuntu Server. Todo el proceso será automatizado mediante scripts Bash.

---

## Requisitos Previos

1. **Máquina Virtual**: 
   - Crea una máquina virtual en VirtualBox:
     - Sistema operativo: Ubuntu Server (64-bit).
     - RAM: Al menos 2 GB.
     - Disco duro: Al menos 20 GB.
   - Conecta la ISO de Ubuntu Server descargada de [Ubuntu](https://ubuntu.com/download/server).
   - Configura red con NAT y reenvío de puertos:
     - SSH: 2222 → 22
     - HTTP: 8080 → 80
     - HTTPS: 8443 → 443.

2. **Sistema actualizado**:
   Después de instalar Ubuntu Server, ejecuta:
   ```bash
   sudo apt update && sudo apt upgrade -y
