### Vuls
- Escanear la imagen desde el cliente de Docker, usando SYNK
docker scan 0gis0/python-app

- Despues de febrero de 2023, el escano de vulneabiliades cambio, es interno de Docker

En Docker Hub, en cualquier repositorio, en Settings
debajo de "Image insight settings"
- Advanced image analysis provided by Docker Scoutt"
- Basic Hub vulnerability scanning -> It is not free
- None -> Default



Referencia:
https://docs.docker.com/docker-hub/vulnerability-scanning/
https://www.returngis.net/2021/09/buscar-vulnerabilidades-en-imagenes-de-docker-con-snyk/