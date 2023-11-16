source variables.bash

echo "$(mysqldump -u root -p1234 wordpress > /tmp/mysqlWp.aql)"
creatingTar=$(tar -cf /backups/$year/$month/first.tar /var/www/html/* /tmp/mysqlWp.aql)
echo "$creatingTar, $(rm /tmp/mysqlWp.aql)"
