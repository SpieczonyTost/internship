source variables.bash

creatingTar=$(tar -cf /backups/$year/$month/$week/$timeFull.tar /var/www/html/* /tmp/mysqlWp.aql)
echo "$creatingTar"
