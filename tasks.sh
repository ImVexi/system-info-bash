#!/bin/bash

echo "HOSTNAME:"; hostname
echo; echo "OS:"; grep -i PRETTY_NAME /etc/os-release | cut -d '"' -f2
echo; echo "UPTIME:"; uptime -p
echo; echo "KERNEL:"; uname -r
echo; echo "CPU:"; lscpu
echo; echo "MEMORY:"; free -h
echo; echo "NETWORK:"; ip addr show 2>/dev/null || ifconfig -a 2>/dev/null
echo; echo "FILESYSTEM:"; df -hT
echo; echo "LAST 5 ERRORS:"; grep -i error /var/log/syslog 2>/dev/null | tail -n 5 || journalctl --no-pager | grep -i error | tail -n 5
echo; echo "LOGGED-IN USERS:"; who
echo; echo "LAST REBOOT:"; who -b
echo; echo "TOP 10 PROCESSES (CPU):"; ps aux --sort=-%cpu | head -n 11
echo; echo "TOP 10 PROCESSES (MEMORY):"; ps aux --sort=-%mem | head -n 11
echo; echo "INSTALLED PACKAGE COUNT:"; dpkg -l 2>/dev/null | grep -c '^ii' || rpm -qa 2>/dev/null | wc -l
echo; echo "LISTENING PORTS:"; ss -tuln
echo; echo "TOP-LEVEL DIRECTORY SIZES (/var):"; du -sh /var/* 2>/dev/null
echo; echo "LOGGED USER SESSIONS (LAST 5):"; last -n 5
