read -p "请输入应用程序名称:" APPNAME
read -p "请设置你的容器内存大小(默认256):" RAMSIZE

CURDIR=`pwd`
DIRNAME=$HOME/binary-example
V2RAY_TMPDIR="v2ray-tmp"
UUID=`cat /proc/sys/kernel/random/uuid`
PATH=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16)

if [ -z "$RAMSIZE" ];then
    RAMSIZE=256
fi

rm -rf $DIRNAME
mkdir $DIRNAME
cd $DIRNAME

wget https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip -d $V2RAY_TMPDIR v2ray-linux-64.zip
cd $V2RAY_TMPDIR
chmod 777 *
cd $DIRNAME

rm -rf v2ray-linux-64.zip
mv $DIRNAME/$V2RAY_TMPDIR/v2ray $DIRNAME/v2ray
mv $DIRNAME/$V2RAY_TMPDIR/v2ctl $DIRNAME/v2ctl
rm -rf $DIRNAME/$V2RAY_TMPDIR

echo '{"inbounds":[{"port":8080,"protocol":"vmess","settings":{"clients":[{"id":"'$UUID'","alterId":64}]},"streamSettings":{"network":"ws","wsSettings":{"path":"/'$PATH'"}}}],"outbounds":[{"protocol":"freedom","settings":{}}]}' > $DIRNAME/config.json

