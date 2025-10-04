#!/bin/bash

echo "🔧 Đang cấu hình IP tĩnh cho ens18..."

# Tạo file cấu hình systemd-networkd
sudo mkdir -p /etc/systemd/network

cat <<EOF | sudo tee /etc/systemd/network/10-ens18.network
[Match]
Name=ens18

[Network]
Address=192.168.1.174/24
Gateway=192.168.1.1
DNS=8.8.8.8
DHCP=no
EOF

# Tắt Netplan nếu có
sudo mv /etc/netplan/00-installer-config.yaml /etc/netplan/00-installer-config.yaml.bak 2>/dev/null

# Restart dịch vụ mạng
sudo systemctl restart systemd-networkd

echo "✅ Hoàn tất. Vui lòng reboot để áp dụng."
