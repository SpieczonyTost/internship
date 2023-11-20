source /scripts/variables

rm /backupsUbuntu/$year/$month/*
creatingMonth=$(mkdir /backupsUbuntu/$year/$month/$week)
echo "$creatingMonth, $(chown backups:backups /backupsUbuntu/$year/$month/$week)"