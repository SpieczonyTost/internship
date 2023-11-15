year=$(date +"%Y")
month=$(date +"%m_%B")
creatingMonth=$(mkdir /backups/$year/$month)
echo "$creatingMonth"
