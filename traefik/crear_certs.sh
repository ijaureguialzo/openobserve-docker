#!/bin/bash

DOMINIO="$1"

mkdir -p traefik/certs
cd traefik/certs || exit

rm -f cert.crt
rm -f cert.key
rm -f *.pem

mkcert $DOMINIO "*.$DOMINIO"

ln -s $DOMINIO+1.pem cert.crt
ln -s $DOMINIO+1-key.pem cert.key
