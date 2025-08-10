# Étape 1 : Build du site Maven
FROM maven:3-eclipse-temurin-21-alpine AS builder
WORKDIR /app
COPY . .
RUN mvn site

# Étape 2 : Serveur HTTP pour le site généré
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
ARG VERSION=latest
LABEL version="${VERSION}"
LABEL org.opencontainers.image.description="HTTP server for Maven site"
LABEL org.opencontainers.image.source=https://github.com/tiogars/maven-site
LABEL org.opencontainers.image.licenses=MIT
COPY --from=builder /app/target/site ./
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
