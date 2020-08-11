#!/bin/bash

NC='\033[0m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YEL='\033[0;33m'
GRN='\033[0;32m'

zero="0"

DIR1=/home/$USER/.steam/steam/config

DIR2=/media/$USER/CrucialXTB/steam/steamapps
cd $DIR2;
sort -nr *.acf |grep '"AutoUpdateBehavior"' |uniq -c
for filename in $(ls $DIR2/*.acf|sort -V)
do (
    if [ 'grep -q '"AutoUpdateBehavior"' "$filename"|grep $zero' ]
    then
        echo -e ${YEL}"$filename";
        grep --color=always "AutoUpdateBehavior" "$filename";
        cat "$filename"|grep -q '"AutoUpdateBehavior".*"0"' && sed -i -s '/"AutoUpdateBehavior".*"0"/ s/0/1/g' "$filename";
        exit 0;
fi
)
done
sort -nr *.acf |grep '"AutoUpdateBehavior"' |uniq -c

DIR3=/home/$USER/.steam/steam/SteamApps
cd $DIR3;
sort -nr *.acf |grep '"AutoUpdateBehavior"' |uniq -c
for filename in $(ls $DIR3/*.acf|sort -V)
do (
    if [ 'grep -q '"AutoUpdateBehavior"' "$filename"|grep $zero' ]
    then
        echo -e ${YEL}"$filename";
        grep --color=always "AutoUpdateBehavior" "$filename";
        cat "$filename"|grep -q '"AutoUpdateBehavior".*"0"' && sed -i -s '/"AutoUpdateBehavior".*"0"/ s/0/1/g' "$filename";
        exit 0;
fi
)
done
sort -nr *.acf |grep '"AutoUpdateBehavior"' |uniq -c
