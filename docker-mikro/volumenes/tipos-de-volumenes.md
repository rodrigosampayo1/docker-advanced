Tipos de almacenamiento
- volumenes
- bind
- tmpfs

- Volumenes
se almacenan, /var/lib/docker/volumes/
Pueden ser anonimos o nombrados
Ejemplo usando --mount
docker run -d \
  --name=mongo \
  --mount source=mongo-data,target=/data/db \
  mongo

Podes usar -v o --mount, la diferencia que --mount es mas explicito y podes aplicar drivers, etc.
Ejemplo de mount
    --mount 'type=volume,src=<VOLUME-NAME>,dst=<CONTAINER-PATH>,volume-driver=local,volume-opt=type=nfs,volume-opt=device=<nfs-server>:<nfs-path>,"volume-opt=o=addr=<nfs-address>,vers=4,soft,timeo=180,bg,tcp,rw"'

- Bind
En este caso, la información no se almacena en /var/lib/docker/volumes sino que eres tú el que elige qué sitio de tu sistema de ficheros quieres compartir con el contenedor.
Ejemplo:
docker run -d \ 
  --name webapp \
  --mount type=bind,source="/.web:/usr/share/nginx/html \
  nginx:latest


- tmpfs
El último caso se utiliza para almacenar información en memoria. Esta solo funciona si estás ejecutando Docker en Linux
A diferencia de las otras dos opciones, esta tercera sólo mantiene la información mientras el contenedor se está ejecutando, por lo que es el lugar perfecto para almacenar temporalmente información sensible.
 Si bien con los volúmenes y con los bind mounts es posible compartir la información entre contenedores, en este caso no lo es
Ejemplo:
docker run -d \  
  --name webapp \
  --mount type=tmpfs,destination=/var/tmp \
  nginx:latest


REF:
https://www.returngis.net/2019/02/gestionar-los-datos-de-tus-contenedores-de-docker/