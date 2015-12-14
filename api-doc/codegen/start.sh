#!/bin/bash -xe
# ./start.sh <PORT> <SERVER>

NAME=zexy-kitchen_node_${1}

docker rm -f ${NAME} || true
docker run --name ${NAME} -d -p $1:8080 -w /src -v $2:/src zexy-kitchen/node-tools /bin/bash -c "npm install && node ."
