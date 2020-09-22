#!/bin/bash

CURDIR=`pwd`
DIRNAME=$CURDIR
V2RAY_TMPDIR="v2ray-tmp"
UUID=`cat /proc/sys/kernel/random/uuid`
WSPATH=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16)

wget https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip -d $V2RAY_TMPDIR v2ray-linux-64.zip
chmod 777 $V2RAY_TMPDIR/*

rm -rf v2ray-linux-64.zip
mv $DIRNAME/$V2RAY_TMPDIR/v2ray $DIRNAME/v2ray.txt
mv $DIRNAME/$V2RAY_TMPDIR/v2ctl $DIRNAME/v2ctl.txt
rm -rf $DIRNAME/$V2RAY_TMPDIR

echo '{"inbounds":[{"port":8080,"protocol":"vmess","settings":{"clients":[{"id":"'$UUID'","alterId":64}]},"streamSettings":{"network":"ws","wsSettings":{"path":"/'$WSPATH'"}}}],"outbounds":[{"protocol":"freedom","settings":{}}]}' > $DIRNAME/config.json

