source variables.bash

lastBackup=$(ls -t /backups/$year/$month/$week | head -1)
difference=$(find /var/www/html -type f -newer /backups/$year/$month/$week/$lastBackup -print0 | tar -cf /backups/$year/$month/$week/$time.tar -T - /tmp/mysqlWp.aql)
echo "$difference, $lastBackup"
