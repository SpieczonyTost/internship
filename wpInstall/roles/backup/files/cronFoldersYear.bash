source /scripts/variables

creatingYear=$(mkdir /backups/$year)
echo "$creatingYear, $(chown backups:backups /backups/$year)"
