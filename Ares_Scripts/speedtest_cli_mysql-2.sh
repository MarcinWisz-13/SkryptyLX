#!/bin/bash

MYSQL_HOST="192.168.10.7"
MYSQL_PORT="3306"
MYSQL_USER="admin"
MYSQL_PASS="admin"
MYSQL_DB="speedtest_db"

CURR_DATE=$(date +"%Y-%m-%d")

SPEEDTEST_OUT=$(speedtest-cli --json)
DOWNLOAD_SPEED=$(echo "$SPEEDTEST_OUT" | grep -oP '"download": \K\d+')
UPLOAD_SPEED=$(echo "$SPEEDTEST_OUT" | grep -oP '"upload": \K\d+')

DOWNLOAD=$(expr $DOWNLOAD_SPEED / 1000000)
UPLOAD=$(expr $UPLOAD_SPEED / 1000000)

QUERY="INSERT INTO speedtest_table (data, download, upload) VALUES ('$CURR_DATE', $DOWNLOAD, $UPLOAD);"
mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASS $MYSQL_DB -e "$QUERY"
