#!/bin/sh
if [ "$(ls -A $(pwd)/app/productup-challenge-xml-data-importer)" ]
 then
    echo 'dir is present...'
 else
    git clone git@github.com:arunnabraham/productup-challenge-xml-data-importer.git
fi
docker build --no-cache -t localhost/php-cli-alpine:latest .
rm -rf ./productup-challenge-xml-data-importer



## if [("$CONTAINER_TECHNOLOGY"!="docker")]
# then
#    podman run \
#    -v $(pwd)/.env:$CONTAINER_WORK_DIR'/.env':z \
#    -v $(pwd)/logs:$CONTAINER_WORK_DIR'/logs':z \
#    -v $(pwd)/outputfiles:$CONTAINER_WORK_DIR'/outputfiles':z \
#    -v $(pwd)/tmp:/tmp:z \
#    -i --rm localhost/php-cli-alpine:latest php ./run $1 $2 $3 $4 $5 $6
## else