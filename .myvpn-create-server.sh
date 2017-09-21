#!/bin/bash

set -e

function announce() {
    echo -e "\n\n\n***************************************"
    echo "[REMOTE] $1"
    echo "***************************************"
}

announce "Install OpenVPN"
sudo apt-get install -y openvpn

announce "Now generate a static key for a simple private one to one VPN"
openvpn --genkey --secret ./static.key
chmod 600 ./static.key

announce "Load the iptable NAT module, setup IP forwarding and NAT"
sudo modprobe iptable_nat
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
sudo iptables -t nat -A POSTROUTING -s 10.8.0.1/24 -o eth0 -j MASQUERADE

announce "Create configuration file"
echo "dev tun
ifconfig 10.8.0.1 10.8.0.2
secret static.key
comp-lzo
keepalive 10 60
ping-timer-rem
persist-tun
persist-key
" > ./server.conf
