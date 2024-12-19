#!/bin/bash

source .easytier.conf

/usr/local/bin/easytier-core --ipv4 192.168.21.1/24 --peers $PEER \
    -e tcp://public.easytier.top:11010 -n 192.168.22.0/24 \
    --network-name $NNAME  --network-secret $NSECRET
