echo "********************************Enter year********************************"
echo "Available: $(ls /backups)"
read restoreYear
echo "********************************Enter month********************************"
echo "Available: $(ls /backups/$restoreYear)"
read restoreMonth
echo "********************************Enter week********************************"
echo "Available: $(ls /backups/$restoreYear/$restoreMonth -I first.tar)"
read restoreWeek
echo "********************************Enter date********************************"
echo "Available: $(ls /backups/$restoreYear/$restoreMonth/$restoreWeek)"
read restoreDay

source variables.bash

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

echo "$(tar -x -C / -f Restored_data.tar)"
echo "$(mysql -u root -p1234 -e "create database wordpress" && mysql -u root -p1234 wordpress < /tmp/mysqlWp.aql && rm /tmp/mysqlWp.aql)"

# mysqldump -u root -p1234 wordpress > mysqlWp.aql
 
# mysql -u root -p1234 wordpress < mysqlWp.aql

# mysql -u root -p1234 -e "create database wordpress"


#apt install vsftpd




#create folders using cron on storing machine and REMEMBER to set ownership to user that is going to upload files
#