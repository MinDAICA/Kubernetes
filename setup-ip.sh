#!/bin/bash

echo "Dang cau hinh IP tinh cho ens18..."

# Tao file cau hinh systemd-networkd
sudo mkdir -p /etc/systemd/network

cat <<EOF | sudo tee /etc/systemd/network/10-ens18.network
[Match]
Name=ens18

[Network]
Address=192.168.1.199/24
Gateway=192.168.1.1
DNS=8.8.8.8
DHCP=no
EOF

# Tat Netplan neu co
sudo mv /etc/netplan/00-installer-config.yaml /etc/netplan/00-installer-config.yaml.bak 2>/dev/null

# Khoi dong lai dich vu mang
sudo systemctl restart systemd-networkd

#Cap quyen thu thi file nay: chmod +x setup-ip.sh


echo "Hoan tat. Vui long reboot de ap dung."
