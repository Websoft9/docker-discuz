sudo echo "Discuz version:$(docker exec -it $1 cat /usr/src/discuz/upload/source/discuz_version.php |grep DISCUZ_VERSION |awk -F"," '{print $2}'|awk -F"'" '{print $2}')" 1>> /data/logs/install_version.txt
