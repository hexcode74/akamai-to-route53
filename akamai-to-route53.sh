#!/bin/bash

########## config #############
#export HTTPS_PROXY=http://proxy.example.com:80

LIST_ZONES=(
example.com
)
AKAMAI_API_URL=https://akab-papsjby6btu42r7f-zomr3jdfhhi33b4q.luna.akamaiapis.net//config-dns/v2/zones
################################

for ZONE in "${LIST_ZONES[@]}"
do 

URL={AKAMAI_API_URL}/${ZONE}/zone-file
./edgegrid-curl/egcurl --eg-edgerc .edgerc \
-H 'Accept: text/dns' "$URL" -o ./dns-backup/akamai/${ZONE}.$(date "+%Y-%m-%d")


FLAG=$(./cli53/cli53 list | grep -c $ZONE)

if [ "$FLAG" == "0" ]; then
	./cli53/cli53 create --comment "akamai to route53 for ${ZONE}" ${ZONE}
	./cli53/cli53 import --file ./dns-backup/akamai/${ZONE}.$(date "+%Y-%m-%d") ${ZONE}
else
	./cli53/cli53 import --replace --file ./dns-backup/akamai/${ZONE}.$(date "+%Y-%m-%d") ${ZONE}
fi

done 

#/usr/bin/find ./dns-backup -mtime +180 -delete;
