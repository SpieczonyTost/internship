time=$(date +"%d_%H:%M")_Full
year=$(date +"%Y")
month=$(date +"%m_%B")
creatingTar=$(tar -cf /backups/$year/$month/$time.tar /cronTest/*)
echo "$creatingTar"
