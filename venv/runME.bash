#!/bin/bash
$first = $1

vagrant up

rm ~/.ssh/known_hosts
rm ~/.ssh/known_hosts.old

ssh -o StrictHostKeyChecking=no vagrant@192.168.50.100 -i ~/.ssh/rsa_key
ssh -o StrictHostKeyChecking=no vagrant@192.168.50.101 -i ~/.ssh/rsa_key

if [ $first == 1 ]; then
ansible-playbook -i ~/Desktop/Project/venv/wpInstall/inventory.yml ~/Desktop/Project/venv/wpInstall/playbook.yml
else
ansible-playbook -i /Users/mikolaj/Documents/gitHubInternship/venv/wpInstall/inventory.yml /Users/mikolaj/Documents/gitHubInternship/venv/wpInstall/playbook.yml
fi
