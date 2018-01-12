# DNS fir home lkab
# Configure net
# BIND on the Primary DNS server
# /etc/default/bind9
# /etc/bind/named.conf
# https://techpolymath.com/2015/02/16/how-to-setup-a-dns-server-for-a-home-lab-on-ubuntu-14-04/

options {
    directory "/var/cache/bind";

    // If there is a firewall
    forwarders {
        0.0.0.0
    };

    ndssec-validation auto;

    auth-nxdomain no;
    listen-on-v6 { any; };
}

// Lab subnets we wish to allow recursive queries from
acl "trusted" {
    10.1.100.0/24; #lab net
}

options {
    directory "/var/cache/bind";
    recursion yes;
    allow-recursion { trusted; };
    listen-on
    allow-transfer { none; };

    forwarder {
        8.8.8.8;
        8.8.4.4;
    };

    dnssec-validation auto;

    auth-nxdomain no;
    listen-on-v6 { any; };
};

# /etc/bin/named.conf.local

zone "homelab.local" {
    type master;
    file "/etc/bind/zones/db.homelab.local";
    allow-transfer { 10.1.100.42; };
};

zone "homelab.local" {
    type master;
    file "/etc/bind/zones/db.homelab.local";
    allow-transfer { 10.1.100.42; };
};

# Create forward zone file.
# Once the zones spec in BIND conf we need to create forw and reverse zone files. Start with forward zone file which defines DNS for forward lookups. For example, if a client query DNS server for host1.homelab.local the server will look in the homelab.local forward zone file for a record mapping host1 to it's IP adderss.
# Once zone spec in BIND we create forw and reverse. Start with forw - it def forw lookups. client ask host1.homelab.local - server look in homelab.local for IP-host mapping.

#The forw zone file in where defined DNS rec for forward DNS lookups. That is when DNS recieves a name query. "host1.homelab.local" it will look in the forw zone file to resolve host1's corresp private IP address.
# in named.conf.local file the default zine file loc was specified to be  /etc/bind/zones. 
mkdir /etc/bind/zones
/etc/bind/zones/db.homelab.local

@ IN SOA localhost. root.localhost (
    2 ; Serial
    604800 ; Refresh
    86400 ; Retry
    2419200 ; Expire
    604800 ) ;Negative Cache TTL
;
@ IN NS localhost.
@ IN A 127.0.0.1
@ IN AAAA ::1

#SOA replace with FQDN, increment serial (ns1 is for future searching?)

# Create Reverse zone file


#Check BIND syntax
sudo named-checkconf
sudo named-checkzone homelab.local db.homelab.local
zone homelab.local/IN loaded serial 3


# Install bind on 2nd server 
# Conf 2ndry DNS server
## Conf optinos file
# Config Local DNS Zones
# Check BIND conf File Syntax
# Restat BIND


