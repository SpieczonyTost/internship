echo "********************************Enter year********************************"
echo "Available: $(ls /backupsUbuntu)"
read restoreYear
echo "********************************Enter month********************************"
echo "Available: $(ls /backupsUbuntu/$restoreYear)"
read restoreMonth
echo "********************************Enter week********************************"
echo "Available: $(ls /backupsUbuntu/$restoreYear/$restoreMonth -I first.tar)"
read restoreWeek
echo "********************************Enter date********************************"
echo "Available: $(ls /backupsUbuntu/$restoreYear/$restoreMonth/$restoreWeek)"
read restoreDay

source /scripts/variables

file=$(ls /backupsUbuntu/$restoreYear/$restoreMonth/$restoreWeek/$restoreDay* | cut -d "/" -f 6)             # full name of the file
fileFull=$(ls /backupsUbuntu/$restoreYear/$restoreMonth/$restoreWeek/$restoreDay* | cut -d "/" -f 6 | cut -d "_" -f 3 ) # checking if file name contains Full in it
sunday=$(ls /backupsUbuntu/$restoreYear/$restoreMonth/$restoreWeek/*Sunday*) # defining backup from sunday
monday=$(ls /backupsUbuntu/$restoreYear/$restoreMonth/$restoreWeek/*Monday*) # defining backup from monday
wednesday=$(ls /backupsUbuntu/$restoreYear/$restoreMonth/$restoreWeek/*Wednesday*) # defining backup from wednesday
friday=$(ls /backupsUbuntu/$restoreYear/$restoreMonth/$restoreWeek/*Friday*) # defining backup from friday
copying=$(cp $sunday Restored_data.tar) # copying full backup in case user wants it

if test -f /backupsUbuntu/$restoreYear/$restoreMonth/$restoreWeek/$restoreDay*
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

echo "$(chown backups:backups /Restored_data.tar)"

# echo "$(tar -x -C / -f Restored_data.tar)"
# echo "$(mysql -u root -p1234 -e "create database wordpress" && mysql -u root -p1234 wordpress --flush-logs < /tmp/mysqlWp_Full.sql && rm /tmp/mysqlWp_Full.sql)"
# echo "$()"

# mysqldump -u root -p1234 wordpress --flush-logs > /tmp/mysqlWp_Full.sql
 
# mysql -u root -p1234 wordpress < /tmp/mysqlWp_Full.sql

# mysql -u root -p1234 -e "create database wordpress"

# mysql -u root -p1234 -e "drop database wordpress"

# mysqladmin -u root -p1234 flush-logs

# mysqlbinlog /var/log/mysql/mysql-bin.000001 | mysql -u root -p1234 wordpress

#apt install vsftpd




#create folders using cron on storing machine and REMEMBER to set ownership to user that is going to upload files
#baw sie dobrze bo musisz co wymyslic bo cala struktura ktora czytasz jest na innej maszynie a ls glupio wyswietla
#moze po tygodniu usuwaj caly folder jak sie przeslal
#