source /scripts/variables

creatingYear=$(mkdir /backupsUbuntu/$year)
echo "$creatingYear, $(chown backups:backups /backupsUbuntu/$year)"
