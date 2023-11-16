year=$(date +"%Y")
month=$(date +"%m_%B")
day=$(date +"%j")
week=$(($day / 7))
creatingTar=$(tar -cf /backups/$year/$month/$week/first.tar /cronTest/*)
echo "$creatingTar"
