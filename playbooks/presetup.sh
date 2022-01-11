#!/bin/bash
# Run as root!

hostname=hostname
password=password

# Set password for pi-hole
mkdir -p /opt/pihole
umask 177
echo $password | tee /opt/pihole/ph_password

# Free up port 53
sed -i 's/#DNSStubListener=yes/DNSStubListener=no/g' /etc/systemd/resolved.conf
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

# Install ansible
apt install -y ansible

# Configure sshd
cat sshd_config > /etc/ssh/sshd_config
