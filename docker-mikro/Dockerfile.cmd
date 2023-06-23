FROM mikroways/mute
CMD ping localhost

#docker build -t mikroways/mute-with-cmd -f Dockerfile.cmd .
#docker run --rm mikroways/mute-with-cmd
#docker run --rm mikroways/mute-with-cmd hostname

# Conclusion
#CMD te permite sobreescribirlo con el argunmento que va despues de "docker run IMAGE"