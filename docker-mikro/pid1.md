## El PID 1
El PID 1 tiene un significado especial en Linux. Es el PID del proceso init y por ello tiene otras responsabilidades, como por ejemplo adoptar procesos huérfanos y manejar zombies.

Típicamente un proceso que recibe la señal SIGTERM y no implementa un manejador para esa señal tiene el comportamiento de terminar de forma inmediata. Sin embargo, si el PID 1 recibe esta señal y no implementa un manejador, no hará nada.

- docker exec -it pid1 bash

- ps ef
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 19:39 ?        00:00:00 tail -f /dev/null
root          21       0  0 19:56 pts/0    00:00:00 bash
root          29      21  0 19:57 pts/0    00:00:00 ps -ef

- kill -INT 1
tail -f /dev/null &
PID=$!
ps -ef
kill -INT $PID
ps -ef
---
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 19:39 ?        00:00:00 tail -f /dev/null
root          30       0  0 19:59 pts/0    00:00:00 bash
root          39      30  0 19:59 pts/0    00:00:00 tail -f /dev/null
root          40      30  0 19:59 pts/0    00:00:00 tail -f /dev/null
root          41      30  0 19:59 pts/0    00:00:00 tail -f /dev/null
root          42      30  0 19:59 pts/0    00:00:00 ps -ef

- kill -INT $PID

- ps -ef
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 19:39 ?        00:00:00 tail -f /dev/null
root          30       0  0 19:59 pts/0    00:00:00 bash
root          39      30  0 19:59 pts/0    00:00:00 tail -f /dev/null
root          40      30  0 19:59 pts/0    00:00:00 tail -f /dev/null
root          43      30  0 20:00 pts/0    00:00:00 ps -ef
[4]+  Interrupt               tail -f /dev/null
