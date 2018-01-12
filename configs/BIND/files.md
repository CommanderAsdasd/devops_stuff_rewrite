#http://xgu.ru/wiki/%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0_DNS-%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80%D0%B0_BIND
#/etc/bind/named.conf
#/etc/bind/named.conf.options
#/etc/bind/named.conf.local 
zone "unix.nt" {
        type master;
        file "/etc/bind/db.unix.nt";
        allow-transfer { 127.0.0.1; };
};

zone "15.168.192.in-addr.arpa" {
        type master;
        file "/etc/bind/db.rev_unix.nt";
        allow-transfer { 127.0.0.1; };
};

## zones for straight and reverse transformations
#/etc/bind/db.unix.nt straight
$TTL 3000h
@ SOA unix.nt. user.host180.unix.nt. 2007012000 (
                                                10h ; slave-server connection preiod
                                                1h  ; retry
                                                1w  ; lifetime
                                                1h ); negative ttl

        NS @ 

host1.unix.nt. A 192.168.15.1
host2.unix.nt. A 192.168.15.2
host3.unix.nt. A 192.168.15.3
host4.unix.nt. A 192.168.15.4
host5.unix.nt. A 192.168.15.5
host6.unix.nt. A 192.168.15.6
host7.unix.nt. A 192.168.15.7
host8.unix.nt. A 192.168.15.8
host9.unix.nt. A 192.168.15.9
host10.unix.nt. A 192.168.15.10
host11.unix.nt. A 192.168.15.11
.
.
.

host251.unix.nt. A 192.168.15.251
host252.unix.nt. A 192.168.15.252
host253.unix.nt. A 192.168.15.253
host254.unix.nt. A 192.168.15.254

#/etc/bind/db.rev_unix.nt reverse

15.168.192.in-addr.arpa. 10800 IN SOA unix.nt. user.host180.unix.nt. 2007012001 (
                                                10h  ; slave-server connection period
                                                1h   ; retry
                                                1w   ; life-time
                                                1h ) ; negative ttl

                NS host180.unix.nt.

1 PTR host1.unix.nt.
2 PTR host2.unix.nt.
3 PTR host3.unix.nt.
4 PTR host4.unix.nt.
5 PTR host5.unix.nt.
6 PTR host6.unix.nt.
7 PTR host7.unix.nt.
8 PTR host8.unix.nt.
9 PTR host9.unix.nt.
10 PTR host10.unix.nt.
11 PTR host11.unix.nt.
.
.
.
250 PTR host250.unix.nt.
251 PTR host251.unix.nt.
252 PTR host252.unix.nt.
253 PTR host253.unix.nt.
254 PTR host254.unix.nt.

#reolv.conf