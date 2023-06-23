# Build y Buildkit
El contexto es utilizado diferente por docker build dependiendo de si se habilita o no buildkit.

- Sin Buildkit, el contexto siempre es enviado al servicio docker para construir la imagen.
- Con buildkit, el contexto se envía sólo si en el Dockerfile se utiliza COPY.

### Cuando queremos evitar se envíe determinado archivo, podemos usar .dockerignore.

### Copy y AND
Para poder agregar archivos en las imágenes se utilizan las instrucciones COPY o ADD. ¿Dos instrucciones para hacer lo mismo?
- ADD admite agregar URLs remotas o archivos en formato tar. Útil en casos como por ejemplo ADD rootfs.tar.xz /.
- COPY admite únicamente copiar archivos o carpetas del contexto.

Se recomienda usar COPY porque es mas intuitivo

### Buenas practicas
- Cuando creamos una imagen que requiere incluir varios archivos del contexto, conviene incluirlos por separado con algún criterio
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY . /tmp/

En este ejemplo, los requerimientos no suelen cambiar. Entonces la regeneración de la imagen podrá utilizar la cache que ya tiene instaladas las dependencias

- Utilizar curl o wget en favor de ADD. En vez de:
ADD https://example.com/big.tar.xz /usr/src/things/
RUN tar -xJf /usr/src/things/big.tar.xz -C /usr/src/things
RUN make -C /usr/src/things all

Se recomienda:
RUN mkdir -p /usr/src/things \
    && curl -SL https://example.com/big.tar.xz \
    | tar -xJC /usr/src/things \
    && make -C /usr/src/things all

Para minimizar el numero de capas se recomienda
- Sólo las instrucciones RUN, COPY y ADD crearán capas. Otras instrucciones crearán capas intermedias que no incrementarán el tamaño del build.
- Cuando sea posible, utilizar multistage builds para únicamente copiar los artefactos en la imagen final. Esto permitirá instalar compiladores, herramientas de debug y demás extras que no serán necesarias en la imagen final.