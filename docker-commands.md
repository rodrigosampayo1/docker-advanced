### Dockerfile
WORKDIR, indica el directorio de trabajo, sino crea

CMD, son los comandos que se ejecutan por defecto cuando corres el contenedor
Pero se pueden sobreescribir facilmente, usando docker run .... sh
Casos de uso, para servidores web, o para servicios que corran al inicio

ENTRYPOINT, esta pensando para no sobreescribir, pero se podria hacer tambien.
EN casos normales, si hago docker run...sh, no funciona porque en ENTRYPOINT ["python"] no sabe como leer sh
Como funciona? Le tengo que pasar en "docker run....ARG1 ARG2", ARG deben ser argumentos, no comandos como SH
Casos de uso, para pensar el contendor como un ejecutable

RUN, correr comandos al momento de construir la imagen