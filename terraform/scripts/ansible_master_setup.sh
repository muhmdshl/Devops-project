#!/bin/bash
# Update & Install Ansible
sudo apt update && sudo apt upgrade -y
sudo apt install ansible -y
sudo apt install python3 -y

# Generate SSH key (without prompt)
ssh-keygen -t rsa -N "" -f /home/ubuntu/.ssh/id_rsa

# Allow SSH to slaves
cat /home/ubuntu/.ssh/id_rsa.pub >> /home/ubuntu/.ssh/authorized_keys
chmod 600 /home/ubuntu/.ssh/authorized_keys
