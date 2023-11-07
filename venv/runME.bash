#!/bin/bash
rm ~/.ssh/known_hosts
rm ~/.ssh/known_hosts.old

ssh -o StrictHostKeyChecking=no vagrant@192.168.50.100 -i ~/.ssh/rsa_key
ssh -o StrictHostKeyChecking=no vagrant@192.168.50.101 -i ~/.ssh/rsa_key

ansible-playbook -i ~/Desktop/venv/wpInstall/inventory.yml ~/Desktop/venv/wpInstall/playbook.yml
