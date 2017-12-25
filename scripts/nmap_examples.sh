#!/bin/bash

nmap -v scanme.nmap.org

nmap -sS -O scanme.nmap.org/24

nmap -sV -p 22,53,110,143,4564 198.116.0-255.1-127

nmap -v -iR 100000 -PN -p 80

nmap -PN -p80 -oX logs/pb-port80scan.xml -oG logs/pb-port80scan.gnmap 216,163,128.20/20

#ping through interface