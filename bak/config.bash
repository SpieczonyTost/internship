#!/bin/bash

script_dir="/etc/bak"
app_dir="$script_dir/backups/$(date +'%Y')"

# read the weekCounter file
weekCounter=$((`cat $app_dir/weekCounter`))

archive_dest="$app_dir/$weekCounter/$(date +'%A_%d_%m_')"
archive_metadata="$app_dir/$weekCounter/metadata.snar"
archive_src="/usr/share/nginx/html"

weekCounterFile="$app_dir/weekCounter"

counter_file="$app_dir/$weekCounter/counter"

current_day=$(date +'%d')

# for ftp
HOST=192.168.50.105
USER=backups
PASSWORD=123

