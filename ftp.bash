HOST=192.168.50.103
USER=vagrant
PASSWORD=vagrant

ftp -inv $HOST <<EOF
user $USER $PASSWORD
put $1
bye
EOF
