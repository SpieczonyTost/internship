source /scripts/variables

creatingMonth=$(mkdir /backupsUbuntu/$year/$month)
echo "$creatingMonth, $(chown backups:backups /backupsUbuntu/$year/$month)"