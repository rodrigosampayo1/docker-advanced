## Multistage
Contexto:
Para evitar tener 2 o mas dockerfiles, uno para buildear la imagen y otro para correr
No se podia poner dos FROM en un mismo dockerfile

Dockerfile
WORKDIR, indica el directiorio de trabajo, si no existe lo crea

- la magia
COPY --from=0 # toma como la imagen 0 la primera
COPY --from=builder /path/image/1 /path/image/2 # Toma como la imagen, la primera usando AS builder

#LO mismo que lo anterior, pero lo podes traer de afuera del dockerfile
COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf

### Conclusion
Sirve para copiar algunas librerias, o carpetas o archivos de imagenes mas grandes,
para formar una imagen con lo necesario