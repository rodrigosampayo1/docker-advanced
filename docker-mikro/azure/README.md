- Crear un contexto en Docker Desktop asociado a ACI
docker login azure

- Crear contexto
docker context create aci aci-context

- Crear un contenedor desde Docker Desktop en ACI
docker context use aci-context

- Crear contenedor
docker run --name apache-app -p 80:80 httpd

- docker ps
Se ve como un contenedor normal

- docker rm apache-app

REF
https://www.returngis.net/2020/06/usar-azure-container-instances-para-ejecutar-los-contenedores-de-docker-desktop/