#!/bin/sh
set -e

# Générer et déployer le site
mvn clean site

# Copier le site généré vers le dossier nginx
cp -r /app/target/site/* /usr/share/nginx/html/

# Changer le propriétaire des fichiers pour nginx
chown -R nginx:nginx /usr/share/nginx/html/

# Démarrer nginx
nginx -g "daemon off;"
