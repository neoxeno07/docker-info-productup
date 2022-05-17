#!/bin/sh
if [ -f .env ]; then
    export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)

    docker run \
    -v $(pwd)/.env:$CONTAINER_WORK_DIR'/.env' \
    -v $(pwd)/logs:$CONTAINER_WORK_DIR'/logs' \
    -v $(pwd)/outputfiles:$CONTAINER_WORK_DIR'/outputfiles' \
    -v $(pwd)/tmp:/tmp \
    -i --rm localhost/php-cli-alpine:latest php ./run $1 $2 $3 $4 $5 $6

fi