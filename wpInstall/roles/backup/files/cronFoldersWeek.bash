source /scripts/variables

creatingMonth=$(mkdir /backups/$year/$month/$week)
echo "$creatingMonth, $(chown backups:backups /backups/$year/$month/$week)"