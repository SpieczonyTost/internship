#!/bin/bash
first=$1

vagrant up

rm ~/.ssh/known_hosts
rm ~/.ssh/known_hosts.old

ssh -o StrictHostKeyChecking=no vagrant@192.168.50.100 -i ~/.ssh/rsa_key
ssh -o StrictHostKeyChecking=no vagrant@192.168.50.101 -i ~/.ssh/rsa_key
ssh -o StrictHostKeyChecking=no vagrant@192.168.50.102 -i ~/.ssh/rsa_key
ssh -o StrictHostKeyChecking=no vagrant@192.168.50.103 -i ~/.ssh/rsa_key

ansible-playbook -i python3Install/inventoryPy.yml python3Install/playbookPy.yml
ansible-playbook -i wpInstall/inventory.yml wpInstall/playbook.yml