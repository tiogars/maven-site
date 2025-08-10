# Étape 1 : Build du site Maven
FROM maven:3-eclipse-temurin-21-alpine AS builder
WORKDIR /app
COPY . .
ARG VERSION=latest
RUN mvn site

# Étape 2 : Serveur HTTP pour le site généré
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
ARG VERSION=latest
LABEL version="${VERSION}"
COPY --from=builder /app/target/site ./
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
