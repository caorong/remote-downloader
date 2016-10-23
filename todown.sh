#!/bin/bash

echo "param=$@"

SERVER=$1
BT_FILE=$2
OVERWRITE=$3

#--allow-overwrite

DL_NAME_=${BT_FILE/\.torrent/}


scp $BT_FILE $SERVER:download

if [ $OVERWRITE ]
then
    echo $OVERWRITE
    ssh $SERVER "cd download && nohup ./down.sh $BT_FILE --allow-overwrite=true &"
else
    ssh $SERVER "cd download && nohup ./down.sh $BT_FILE &"
fi


rsync -z -r --partial --progress --rsh=ssh $SERVER:download/$DL_NAME_ ./

