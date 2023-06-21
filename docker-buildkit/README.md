- enable on Docker desktop
- or add .bashrc, export DOCKER_BUILDKIT=1

para que?
Construccion en paralelo de capas
optimizacion de capas, solo se queda con las capas que son necesariasx|


te permite, no almacenar datos sensibles o datos pesados en capas, estas capas quedan cacheadas en /var/lib..
--mount-type= ssh
              secret
              