#docker zabbix server
docker run --name some-zabbix-server-mysql -e DB_SERVER_HOST="mysql-server" -e MYSQL_USER="user" -d zabbix/zabbix-server-mysq:tag

#Mysql server
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag

docker run --name 

docker run --name some-mysql -v /my/own/datadir:/var/lib/mysql -e 

#docker storage driver
# Use Docker volumes to write data. Storage drivers is for Docker able write container's writable layer
# ZFS storage in practice

systemctl stop docker
sudo cp -au /var/lib/docker/ /var/lib/docker.bk
sudo rm -rf /var/lib/docker/*
#ceate zpool on dedicated block device or devices
#BE CAREFUL, THIS IS DESTRUCTIVE
sudo zpool create -f zpool-docker -m /var/lib/docker /dev/xvdf /dev/xvdg
sudo zfs list
# edit /etc/docker/daemon.json
{
    "storage-driver": "zfs"
}
systemctl start docker
docker info

#How ZFS storage driver works


#manage zfs
sudo zpool add zpool-docker /dev/xvdh
#/etc/docker/daemon.json
{
    "storage-driver": "zfs",
    "storage-opts": ["size=256M"]
}



# docker official manual
# start mysql
docker run --name mysql-server -t \
    -e MYSQL_DATABASE
    -e
    -e
    -e
    --character-ser-server=utf8 --collation-server=utf8-bin

# Start Java gateway
docker run --name zabbix-java-gateway -t \
    -d zabbix/zabbix-java-gateway:latest

# Zabbix server instance
 docker run --name zabbix-server-mysql -t

# Start Zabbix web interface with created myysql server and 

#entrypoint.sh