#!/bin/sh
if [ "$(ls -A $(pwd)/app/productup-challenge-xml-data-importer)" ]
 then
    git clone git@github.com:arunnabraham/productup-challenge-xml-data-importer.git
    git checkout developing
fi
podman build -t localhost/php-cli-alpine:latest .