year=$(date +"%Y")
month=$(date +"%m_%B")
day=$(date +"%j")
week=$(($day / 7))
creatingMonth=$(mkdir /backups/$year/$month/$week)
echo "$creatingMonth"