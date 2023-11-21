#!/bin/bash

source config.bash

# month info

if test -f "$app_dir/$weekCounter/monthInfo"; then
	monthInfo=$(cat $app_dir/$weekCounter/monthInfo)
	current_month=$(date +'%B')
	
	if [ "$monthInfo" != "$current_month" ] ; then
		echo $(date +'%B') >> $app_dir/$weekCounter/monthInfo 
	fi
else
	touch $app_dir/$weekCounter/monthInfo
	echo  $(date +'%B') > $app_dir/$weekCounter/monthInfo
fi

# day info

if test -f "$app_dir/$weekCounter/dayInfo"; then
        dayInfo=$(cat $app_dir/$weekCounter/dayInfo)
	
	echo -n ,$current_day >> $app_dir/$weekCounter/dayInfo
else
        #touch $app_dir/$weekCounter/dayInfo
	echo -n $current_day > $app_dir/$weekCounter/dayInfo
fi

# counter
if test -f "$counter_file"; then
        counter="$((`cat $counter_file` + 1))"
        echo "$counter" > $counter_file
else
	echo 0 > $counter_file
        counter=0
fi

# directory
if test -d "$app_dir/$weekCounter"; then
	echo "Directory for year and week is present"
else
	mkdir -p $app_dir/$weekCounter
fi

# get the mysql dump
#
#

if [ "$counter" == 0 ]; then
	mysqldump -uroot -p1234 --all-databases --single-transaction --flush-logs --master-data=2 > $script_dir/mariadb/full_backup$weekCounter.sql
	rm -rf /var/lib/mysql/mysql-bin.*

	mysqladmin -u root -p1234 flush-logs

	# backup what said + full mysql dump
	tar -b 64 --verbose --create --file="$archive_dest$counter.tar"  --listed-incremental=$archive_metadata $archive_src $script_dir/mariadb/full_backup$weekCounter.sql

else
	mysqladmin -u root -p1234 flush-logs
	rm -rf $script_dir/mariadb_logs/*
	cp -r /var/lib/mysql/mysql-bin.* $script_dir/mariadb_logs
	
	# backup what said + msql logs
	tar -b 64 --verbose --create --file="$archive_dest$counter.tar"  --listed-incremental=$archive_metadata $archive_src $script_dir/mariadb_logs
fi

# tar files for ftp
#	tar --verbose --create --file="$script_dir/$(date +'%F').tar" $script_dir

# send files to backup machine
ftp -inv $HOST <<EOF
user $USER $PASSWORD
binary
cd "/"
mkdir "$script_dir/backups"
mkdir "$app_dir"
mkdir "$app_dir/$weekCounter"
put "$archive_dest$counter.tar" "$archive_dest$counter.tar"
bye
EOF


