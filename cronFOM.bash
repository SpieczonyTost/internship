source variables.bash

echo "$(mysqldump -u root -p1234 wordpress > /tmp/mysqlWp.aql)"
# creatingTar=$(tar -cf /backups/$year/$month/first.tar /var/www/html/* /tmp/mysqlWp.aql)
creatingTar=$(tar -cf /backups/first.tar /var/www/html/* /tmp/mysqlWp.aql)

bash ftp.bash /backups/$year/$month/first.tar

echo "$creatingTar, $(rm /tmp/mysqlWp.aql), $(rm /backups/first.tar)"
