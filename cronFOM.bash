year=$(date +"%Y")
month=$(date +"%m_%B")
creatingTar=$(tar -cf /backups/$year/$month/first.tar /cronTest/*)
echo "$creatingTar"
