# docker-advanced
### Dif RUN, CMD y Entrypoint

### Comandos utiles
- docker save ImageID > ejemplo.tar #almacena en un archivo la imagen, para migrar a otro lado  
- docker load < ejemplo.tar # Carga la imagen guardada con docker save

- docker top containerID # para ver los procesos que corren ahi

- docker events #Para ver logs de los contenedores

- docker diff container1 #Para ver las diferencias de como inicia a como esta actualmente

- docker history imagenID #cuanod no hay dockerfile, te permite ver las capas para crear la imagen

- docker pause y docker unpause containerID #Para pausar, como mandar in sigstop al contenedor

- docker search name #Busca imagenes desde CLI

- docker update --restart=unless-stopped containerID

- docker wait #hasta que un contendor termine o muere, y te muestra la salida, y si termino bien o mal (bien es 0)


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