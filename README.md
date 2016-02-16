# arch-novnc
Docker container running ArchLinux accessible through novnc in a browser


## Build the container
docker build -t ponsfrilus/arch-novnc .

## Run the container
docker run --rm -p 8083:8083 -ti --name arch-novnc -e DISPLAY=:0.0 ponsfrilus/arch-novnc:latest

## Dive into the container
docker exec -it arch-novnc /bin/bash
