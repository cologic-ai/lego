#!/bin/sh

DOMAIN=$1
EMAIL=$2
CLEAN_DOMAIN=$(echo ${DOMAIN} | sed 's|*|_|g')

if [ -f "/.lego/certificates/${CLEAN_DOMAIN}.json" ]; then
    lego --eab --kid ${KID} --hmac ${HMAC} --server https://acme.zerossl.com/v2/DV90 --email ${EMAIL} --dns cloudflare --domains ${DOMAIN} ${EXT_FLAGS} -a renew
else
    lego --eab --kid ${KID} --hmac ${HMAC} --server https://acme.zerossl.com/v2/DV90 --email ${EMAIL} --dns cloudflare --domains ${DOMAIN} ${EXT_FLAGS} -a run
fi

[ -f "/.lego/certificates/${CLEAN_DOMAIN}.json" ] || exit 1
touch /tmp/sleep
sleep 20m
