# Utiliser une image Maven avec Nginx
FROM maven:3-eclipse-temurin-21-alpine

# Installer nginx
RUN apk add --no-cache nginx \
    && mkdir -p /usr/share/nginx/html

# Copier le script d'entrée
COPY nginx-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Copier la configuration nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Labels for the image
ARG VERSION="latest"
LABEL version="${VERSION}"
LABEL org.opencontainers.image.title="Maven Site"
LABEL org.opencontainers.image.description="HTTP server for Maven site"
LABEL org.opencontainers.image.version="${VERSION}"
LABEL org.opencontainers.image.vendor=tiogars
LABEL org.opencontainers.image.source=https://github.com/tiogars/maven-site
LABEL org.opencontainers.image.url=https://github.com/tiogars/maven-site
LABEL org.opencontainers.image.documentation=https://github.com/tiogars/maven-site
LABEL org.opencontainers.image.licenses=MIT

# Exposer le port 80
EXPOSE 80

# Définir le dossier de travail sur les sources Maven
WORKDIR /app

# Démarrer le conteneur
ENTRYPOINT ["/entrypoint.sh"]