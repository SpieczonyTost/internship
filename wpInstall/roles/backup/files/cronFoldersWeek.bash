source /scripts/variables

creatingMonth=$(mkdir /backupsUbuntu/$year/$month/$week)
echo "$creatingMonth, $(chown backups:backups /backupsUbuntu/$year/$month/$week)"