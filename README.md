# docker-advanced

### Variables de entorno
- Use -e KEY=value
- No usar en dockerfile

### Docker image
- Use tag

### Volumenes
- Use -v para guardar la informaicon del contenedor

Se puede usar docker y una CLI y agregar variables de entorno, volumenes, puertos etc, pero es engorroso

Conviene usar Docker compose

### Docker Compose
- Cre un docker-compose.yml
- Correr en CLI, docker-compose up -d

## Networking
- Se podria crear con un comando al estilo "Docker network..."
- Pero la mejor forma es con docker-compose, agregando network, indicando que tipo de driver usa