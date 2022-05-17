#!/bin/sh
if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)

podman run \
-v $(pwd)/.env:$CONTAINER_WORK_DIR'/.env':z \
-v $(pwd)/app/tmp:/tmp:z \
-i --rm localhost/php-cli-alpine:latest php ./run $1 $2 $3 $4 $5 $6
fi