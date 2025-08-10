# tiogars/maven-site

Docker image to render the maven site of a project with maven.

- pom.xml : template to set maven site
- docker-compose.yml : template to set [traefik](https://doc.traefik.io/traefik/)

## Requirements

Maven Java projet with theses files :

- src
- pom.xml

# Usage

Declare this docker-compose.yml with this minimal content :

```yml title:docker-compose.yml
services:
  web:
    image: ghcr.io/tiogars/maven-site:latest
    ports:
      - "8080:80"
```
