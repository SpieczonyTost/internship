time=$(date +"%d_%A")_Full
year=$(date +"%Y")
month=$(date +"%m_%B")
day=$(date +"%j")
week=$(($day / 7))
creatingTar=$(tar -cf /backups/$year/$month/$week/$time.tar /var/www/html/* /tmp/mysqlWp.aql)
echo "$creatingTar"
