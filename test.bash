echo "Enter year: "
read restoreYear
echo "Enter month: "
read restoreMonth
echo "Enter week: "
read restoreWeek
echo "Enter date: "
read restoreDay

file=$(ls /backups/$restoreYear/$restoreMonth/$restoreWeek/$restoreDay* | cut -d "/" -f 6)             # full name of the file
fileFull=$(ls /backups/$restoreYear/$restoreMonth/$restoreWeek/$restoreDay* | cut -d "/" -f 6 | cut -d "_" -f 3 ) # checking if file name contains Full in it
sunday=$(ls /backups/$restoreYear/$restoreMonth/$restoreWeek/*Sunday*) # defining backup from sunday
monday=$(ls /backups/$restoreYear/$restoreMonth/$restoreWeek/*Monday*) # defining backup from monday
wednesday=$(ls /backups/$restoreYear/$restoreMonth/$restoreWeek/*Wednesday*) # defining backup from wednesday
friday=$(ls /backups/$restoreYear/$restoreMonth/$restoreWeek/*Friday*) # defining backup from friday
copying=$(cp $sunday Restored_data.tar) # copying full backup in case user wants it


if test -f /backups/$restoreYear/$restoreMonth/$restoreWeek/$restoreDay*
then
  if [[ "$fileFull" = "Full.tar" ]]
  then
    echo "$copying, $fileFull"
  else
    echo "$file"
    case "$file" in
      *"Monday.tar")
        echo "$copying"
        echo "$(tar -A -f Restored_data.tar $monday)"
      ;;
      *"Wednesday.tar")
        echo "$copying"
        echo "$(tar -A -f Restored_data.tar $monday)"
        echo "$(tar -A -f Restored_data.tar $wednesday)"
      ;;
      *"Friday.tar")
        echo "$copying"
        echo "$(tar -A -f Restored_data.tar $monday)"
        echo "$(tar -A -f Restored_data.tar $wednesday)"
        echo "$(tar -A -f Restored_data.tar $friday)"
    esac
  fi
else
echo "no such file"
fi

# mysqldump -u root -p1234 wordpress > mysqlWp.aql
 
# mysql -u root -p1234 wordpress < mysqlWp.aql

# mysql -u root -p1234 -e "create database wordpress"