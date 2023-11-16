year=$(date +"%Y")
month=$(date +"%m_%B")
day=$(date +"%j")
week=$(($day / 7))
time=$(date +"%d_%A")
timeFull=$(date +"%d_%A")_Full

file=$(ls /backups/$restoreYear/$restoreMonth/$restoreWeek/$restoreDay* | cut -d "/" -f 6)             # full name of the file
fileFull=$(ls /backups/$restoreYear/$restoreMonth/$restoreWeek/$restoreDay* | cut -d "/" -f 6 | cut -d "_" -f 3 ) # checking if file name contains Full in it
sunday=$(ls /backups/$restoreYear/$restoreMonth/$restoreWeek/*Sunday*) # defining backup from sunday
monday=$(ls /backups/$restoreYear/$restoreMonth/$restoreWeek/*Monday*) # defining backup from monday
wednesday=$(ls /backups/$restoreYear/$restoreMonth/$restoreWeek/*Wednesday*) # defining backup from wednesday
friday=$(ls /backups/$restoreYear/$restoreMonth/$restoreWeek/*Friday*) # defining backup from friday
copying=$(cp $sunday Restored_data.tar) # copying full backup in case user wants it