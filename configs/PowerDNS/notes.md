# Authority - server stores domains or redirect request to another servers
pdns_install_repo: ""

# Install dns from the 'master official repository
# Install repo from custom repo

allow-axfr-ips=ip <ip of secondary nameserver>
allow-recursion=ip
config-dir=/etc/powerdns
daemon=yes
disable-axfr=no
guardian=yes
local-address=0.0.0.0
local-port=53
master=yes #this useful for creating replication
module-dir=/sr/lib/x86_64-linux-gnu/pdns
setgid=pdns
setuid=pdns
sokcet-dir=/var/run
version-string=powerdns
include-dir=/etc/powerdns/pdns.d

# Replace <ip of sec nameserver> wit
# Supply config for mysql backend

launch=gmysql
gmysql-host=localhost
gmysql-port=306
gmysql-user=pdns


# PDNS role
- hosts: all
  vars:
    pdns_install_repo:
        apt_repo_origin
        apt_repo
        gpg_key

pdns_config:
    maste: yes
    slave: no
    local-address: 'ip'
    local-ipv6: 'ipv6'
    local-port: '5300'

pdns_backends:
    bind:
        config: '/dev/null'

# example playbooks
- hosts: ns1.example.net
  roles:
    - { role: PowerDNS.pdns }
  vars:
    pdns_backends:
        bind:
            config: '/etc/named/named.conf'

- hosts: ns2.example.net
  roles:
    - { role: PowerDNS.pdns }

# SQLite
# The SQLite database will be created and initialized by role in the location specified by the database_name
- hosts: ns4.example.net
  roles:
    - role: {}
  vars:
    database_name: '/var/lib/powerdns/db.sqlite'
    pdns_config:
        master: true
        slave: false
        local-address: '192.0.2.73'
    pdns_backends:
        gsqlite3:
            database: "{{ database_name }}"
            dnssec: yes
    pdns_sqlite_databases_locations:
        - "{{ database_name }}"

#Mysql
- hosts:
  roles:
    - { role: PowerDNS.pdns }
  vars:
    pdns_config:
        master: true
        local-address: 'ip'
    pdns_backends:
        gmysql:
            host: 192.0.2.120
            port: 3306
            user: powerdns
            pass: pass
            dbname: pass
    pdns_install_repo: ""