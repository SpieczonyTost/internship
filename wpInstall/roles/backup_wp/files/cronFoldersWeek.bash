source /scripts/variables

rm /backups/$year/$month/*
creatingMonth=$(mkdir /backups/$year/$month/$week)
echo "$creatingMonth, $(chown backups:backups /backups/$year/$month/$week)"