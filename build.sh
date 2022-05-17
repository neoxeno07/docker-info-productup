#!/bin/sh
if [ "$(ls -A $(pwd)/app/productup-challenge-xml-data-importer)" ]
 then
    echo 'dir is present...'
 else
    git clone git@github.com:arunnabraham/productup-challenge-xml-data-importer.git
fi
podman build --no-cache -t localhost/php-cli-alpine:latest .
rm -rf ./productup-challenge-xml-data-importer