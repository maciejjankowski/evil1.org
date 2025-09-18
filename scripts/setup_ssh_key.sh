#!/bin/bash
# SSH Key Setup Script for s3.mydevil.net

echo "Setting up SSH key for s3.mydevil.net..."
echo "Make sure you have your server password ready."
echo ""

# Check if SSH key exists
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    echo "No SSH key found. Generating new key pair..."
    ssh-keygen -t rsa -b 4096 -C "mj@Maciejs-Air"
fi

echo "Your public key:"
cat ~/.ssh/id_rsa.pub
echo ""
echo "Copy the above key and add it to ~/.ssh/authorized_keys on your server."
echo "Then test with: ssh evil1@s3.mydevil.net"
