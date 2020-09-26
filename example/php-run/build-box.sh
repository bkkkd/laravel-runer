CONTAINERNAME=thinkphp-runer
WEBPORT=8000
ADMINPORT=
OTHERPARAMS=
DP=$(cd $(dirname $0); pwd)

if [ -f "$DP/.box" ]; then
    source $DP/.box
fi
# define web port
if [ -n "$1" ]; then
	WEBPORT=$1
fi

if [ -n "$2" ]; then
	CONTAINERNAME=$2
fi
if [ -n "$3" ]; then
	ADMINPORT="-p $3:9001"
fi
WP=$(cd $(dirname $0)/..; pwd)
echo "DP:" $DP
echo "WP:" $WP
echo "WEBPORT:"$WEBPORT
echo "CONTAINERNAME:"$CONTAINERNAME
docker stop $CONTAINERNAME
docker rm $CONTAINERNAME
docker run \
    --restart always \
    --name $CONTAINERNAME\
    -p $WEBPORT:8000 \
    $ADMINPORT \
    $OTHERPARAMS \
    -v $WP:/app \
    -v $DP/run.sh:/myapp/run.sh \
    -d registry.cn-hangzhou.aliyuncs.com/bkkkd/laravel-runer
