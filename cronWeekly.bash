time=$(date +"%d_%H:%M")
year=$(date +"%Y")
month=$(date +"%m_%B")
lastBackup=$(ls -t /backups/$year/$month | head -1)
difference=$(find /cronTest -type f -newer /backups/$year/$month/$lastBackup -print0 | tar -cf /backups/$year/$month/$time.tar -T -)
echo "$difference, $lastBackup"
