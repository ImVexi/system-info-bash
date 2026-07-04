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
