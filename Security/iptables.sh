#!/bin/bash

clear
echo With help from: https://www.cyberciti.biz/tips/linux-iptables-10-how-to-block-common-attack.html

# TCP.
# 22  - SSH
# 25  - SMTP
# 80  - HTTP
# 110 - POP3
# 123 - NTP
# 443 - HTTPS
# UDP.
# 110 - POP3
# 631 - IPP

# Block all network traffic.
iptables -F
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# TCP.
iptables -I INPUT -p tcp --dport 22 -j ACCEPT
iptables -I INPUT -p tcp --dport 25 -j ACCEPT
iptables -I INPUT -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -p tcp --dport 110 -j ACCEPT
iptables -I INPUT -p tcp --dport 123 -j ACCEPT
iptables -I INPUT -p tcp --dport 443 -j ACCEPT

# UDP.
iptables -I INPUT -p udp --dport 110 -j ACCEPT
iptables -I INPUT -p udp --dport 631 -j ACCEPT

# Force SYN packets check.
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# Force fragment packets check.
iptables -A INPUT -f -j DROP

# Drop malformed XMAS packets.
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

# Drop all NULL packets.
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
