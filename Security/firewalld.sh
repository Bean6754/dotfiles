#!/bin/bash

systemctl enable firewalld
systemctl start firewalld
systemctl restart firewalld

firewall-cmd --complete-reload
firewall-cmd --set-default-zone=openSUSE-Server
firewall-cmd --complete-reload

systemctl restart firewalld
