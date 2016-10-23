#!/bin/bash

# https://aria2.github.io/manual/en/html/aria2c.html#http-ftp-segmented-downloads

echo "param=$@"

DL_NAME=$1
OPTS=$2

# http://stackoverflow.com/a/1638397/2264912
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH

# echo ${DL_NAME: -7}

DL_NAME_=${DL_NAME/\.torrent/}

IP=`ip route get 1.1.1.1 | awk '{print $NF; exit}'`

echo "$IP start download $DL_NAME to dir $SCRIPTPATH/$DL_NAME_"

#aria2c --seed-time=0 --daemon=true -d $DL_NAME_ $DL_NAME 
aria2c --seed-time=0 $OPTS -d $DL_NAME_ $DL_NAME 

# echo '" '$DL_NAME_' "'

CMD=""

echo $CMD

