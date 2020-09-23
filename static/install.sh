#!/bin/bash

CURDIR=`pwd`
DIRNAME=$CURDIR
V2RAY_TMPDIR="v2ray-tmp"
UUID=`cat /proc/sys/kernel/random/uuid`
WSPATH=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16)

wget https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip -d $V2RAY_TMPDIR v2ray-linux-64.zip

rm -rf v2ray-linux-64.zip
mv $DIRNAME/$V2RAY_TMPDIR/v2ray $DIRNAME/v2ray
mv $DIRNAME/$V2RAY_TMPDIR/v2ctl $DIRNAME/v2ctl
rm -rf $DIRNAME/$V2RAY_TMPDIR
chmod 600 $DIRNAME/v2ray $DIRNAME/v2ctl

CONFIG_JSON='{"inbounds":[{"port":9090,"protocol":"vmess","settings":{"clients":[{"id":"'$UUID'","alterId":64}]},"streamSettings":{"network":"ws","wsSettings":{"path":"/'$WSPATH'"}}}],"outbounds":[{"protocol":"freedom","settings":{}}]}'
CONFIG_JSON_B64=`echo $CONFIG_JSON | base64`

sed -i "s|CONFIG_CONTENT|$CONFIG_JSON_B64|" $DIRNAME/../main.go

echo '======== 以下为配置 ======== '
echo $CONFIG_JSON 
