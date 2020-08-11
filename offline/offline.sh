#!/bin/bash

NC='\033[0m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YEL='\033[0;33m'
GRN='\033[0;32m'

DIR1=/home/$USER/.steam/steam/config/
LFILE1=loginusers.vdf

zero="0"

for filename in $DIR1$LFILE1
do (
    if [ 'grep -q '"WantsOfflineMode"' "$filename"|grep $zero' ]
    then
        echo -e ${YEL}"$filename";
        grep --color=always "WantsOfflineMode" "$filename";
        cat "$filename"|grep -q '"WantsOfflineMode".*"0"' && sed -i -s '/"WantsOfflineMode".*"0"/ s/0/1/g' "$filename";
        exit 0;
fi
)
done

for filename in $DIR1$LFILE1
do (
    if [ 'grep -q '"SkipOfflineModeWarning"' "$filename"|grep $zero' ]
    then
        echo -e ${YEL}"$filename";
        grep --color=always "SkipOfflineModeWarning" "$filename";
        cat "$filename"|grep -q '"SkipOfflineModeWarning".*"0"' && sed -i -s '/"SkipOfflineModeWarning".*"0"/ s/0/1/g' "$filename";
        exit 0;
fi
)
done

chmod 0644 $DIR1$LFILE1
