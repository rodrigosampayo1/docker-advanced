# Registry
- Permite almacener imagens de docker referenciados con nombre y tag
ejemplo:
registry.name.domain/image/name y tags 1.0.0 
- Los usuarios se relacion con el registry on Pull y Push (descargar o subir)
- Imagenes publicas libres, y 1/2 imagens privadas

### Para subir
docker login -u rsampayo2023
- En el caso de Docker Hub necesitamos que nuestra imagen se llame:
docker tag IMAGEN nombre_de_usuario/nombre_del_repositorio:etiqueta
docker tag nodejs-webapp 0gis0/nodejs-webapp:v1

- subir
docker push 0gis0/nodejs-webapp:v1


- En una maquina nueva, se recomienda parar los contenedores y eliminarlos:
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi -f $(docker images -q)

- Ejecutar la imagen descargada de docker hub
docker run -p 4000:3000 0gis0/nodejs-webapp:v1
