source /scripts/variables

creatingMonth=$(mkdir /backups/$year/$month)
echo "$creatingMonth, $(chown backups:backups /backups/$year/$month)"