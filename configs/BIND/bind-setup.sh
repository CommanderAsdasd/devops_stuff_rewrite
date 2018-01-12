# BIND9
#http://xgu.ru/wiki/%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0_DNS-%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80%D0%B0_BIND
mkdir -p {/var/lib/named/etc, /var/lib/named/dev, /var/lib/named/var/cache/bind, /var/lib/named/var/run/bind/run }
mv /etc/bind/ /var/lib/named/etc
ln -s /var/lib/named/etc/bind /etc/bind

# mknod creates special block or symbol devices (FIFO, block, char)
mknod /var/lib/named/dev/null c 1 3
mknod /var/lib/named/dev/random c 1 8
chmod 666 $THESE_DEVICES
chown -R bind:bind /var/lib/named/var/*
chown -R bind:bind /var/lib/named/etc/bind

# Настройка зон
# /var/lib/named/etc/bind/myzones.conf
zone "ex." {
    type master;
    file "/etc/bind/db.ex";
};

touch /var/lib/named/etc/bind/db.ex
chown bind:bind /var/lib/named/etc/bind/db.ex
nano /var/lib/named/etc/bind/db.ex

# db.ex

 $TTL 86400 ; 1 day
 @ IN SOA ex. root.ex, (
 2014110201 ; serial
 10800 ; refresh (3 houes)
 900 ; retry (15 minutes)
 604800 ; expire (1 week)
 86400 ; minimum (1 day)
 )
 @ IN NS ns.ex.

 ns A 127.0.0.1
 server A 192.168.1.1 ; server address

# Обратите внимание на serial зоны. Сервер имён не использует конфигурации с тем же серийным номером или младше чем был указан. ПОэтому всякий раз когда вы вносите исправления в любой из файлов зон, - обязательно увеличивайте этот номер на какое-то значение, я делаю так - дата редактирования + сколько раз менялся файл за день "2014110201"
# Файл обратной зоны для local.rev
local.rev

# dns

# named.conf
# В конец файла - 
include "/etc/bind/myzones.conf";

# в начале файла до включения файла с опциями named.conf.options создадим список acl для указания что будет обслуживать BIND, указав подсеть, обратную петлю и оба DNS провайдера
acl homenet {
    192.168.1.0/24;
    127.0.0.1;
    8.8.8.8;
    8.8.4.4;
};

include "/etc/bind/rndc.key";
controls {
    inet 127.0.0.1 port 953 allow { 127.0.0.1; } keys {rndc-key};
};

zone "1.168.192.in-addr.arpa" {
    type master;
    file "/etc/bin/local.rev";
};

include "/etc/bind/myzones.conf";

