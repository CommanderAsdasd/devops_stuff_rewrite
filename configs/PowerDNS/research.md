# powerdns
https://github.com/phpipam/phpipam/tree/master/app/admin/powerDNS

# Powerdns on  
* https://www.digitalocean.com/community/tutorials/how-to-configure-dns-replication-on-a-slave-powerdns-server-on-ubuntu-14-04

Intro
Prerequisities
INstall PDNS
master server slave server 
Cofigure Master Server

# Conf master examp[le
allow-recursion=0.0.0.0/0
allow-axfr-ips=222.222.222.222/32
config-dir=/etc/powerdns
daemon=yes
dsable-axfr=no
guardian=yes
local-address=
local-port
log-dns-details=on
log-failed-updates
loglevel=
module-dir
master=yes
slave=no
setgid=pdns
setuid=pdns
socket-dir=/var/run
version-string=powerdns
include-dir=/etc/powerdns/pdns.d

# conf slave. Standart slave server configuration with 60-sec interval.
allow-recursion=0.0.0.0/0
config-dir=/etc/powerdns
daemon=yes
disable-axfr=yes
guardian=yes
local-address=0.0.0.0
local-port=53
log-dns-details=on
log-failed-updates=on
loglevel=3
module-dir=/usr/lib/powerdns
master=no
slave=yes
slave-cycle-interval=60
setgid=pdns
setuid=pdns
socket-dir=/var/run
version-string=powerdns
include-dir=/etc/powerdns/pdns.d

## Mysql tune
insert into supermasters values ('111.111.111.111', 'ns2.example-dns.com', 'admin');

## Test Master/Slave Connection
111.111.111.111 ns1.example-dns.com
222.222.222.222 ns2-example-dns.com

## configure DNS Zone with Replication
- add master zone
## test working
dig test.com A @ns1.example-dns.com
