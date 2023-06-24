### Multi Staging
- Reducir el tamaño de las imagenes
Menos tiempo tardará en descargarse.
Menos tardará en cargar en memoria, ya que tendrá solo lo necesario.
Menores serán las vulnerabilidades a las que podamos estar expuestos.

- Si agrego capas con ADD, COPY y RUN, se vuelve mas pesada la imagen, 
aunque el proposito sea que sea mas segura la imagen

- Por eso se usa, Dockerfile multi-stage
Lo que nos permite es poder usar varias instrucciones de tipo FROM dentro de nuestro Dockerfile, lo que genera diferentes fases dentro del proceso de creación de la imagen.

por el camino se han quedado en fase anteriores que no formarán parte de la imagen final, ya que se van creado contenedores intermedios que ejecutan las herramientas y configuraciones que hemos ido necesitando en algún momento del proceso.

>> Ver Dockerfile.multi

## Dockerfile references
https://docs.docker.com/engine/reference/builder/

## Docker Buildkit
Si esta habilitado, todo stage que no afecte al final se obiara, pero en este caso necesitamos las stage intermedias como test

- Por otro lado, como ves en la salida del comando docker images, ahora tienes varias imágenes sin nombre. Estas son las generadas en las fases intermedias y se conocen como danglings. Si quisieras eliminarlas de forma rápida puedes hacerlo con este comando:

docker image prune

- DOCKER_BUILDKIT=0 docker  build -t hello-world:multi-stage . -f Dockerfile.multistage



Ref: 
https://www.returngis.net/2021/08/reduce-el-tamano-de-tus-imagenes-con-dockerfiles-multi-stage/