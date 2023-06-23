FROM ubuntu:20.04
RUN ln -sf /bin/bash /bin/sh
CMD tail -f /dev/null

#docker build -t mikroways/shell-bash -f Dockerfile.bash .
#docker run --rm --name pid1 -d mikroways/shell-bash
#docker exec pid1 ps -ef