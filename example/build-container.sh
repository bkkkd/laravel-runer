CONTAINERNAME=laravel-runer
WEBPORT=8000
WP=$(cd $(dirname $0); pwd)
docker stop $CONTAINERNAME
docker rm $CONTAINERNAME
docker run \
    --restart always \
    --name $CONTAINERNAME\
    -p $WEBPORT:8000 \
    -v $WP:/myapp \
    -d registry.cn-hangzhou.aliyuncs.com/bkkkd/laravel-runer
    
