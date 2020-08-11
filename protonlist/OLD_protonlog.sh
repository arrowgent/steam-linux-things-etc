#!/bin/bash
#example:
#Mapping AppID 01000101 to tool proton_666 with priority 250

#test works: example
#grep -o -E 'Mapping.*priority\ 250' /home/$USER/.steam/steam/logs/compat_log.txt|sort -V|uniq

#$STEAM
clog=/home/$USER/.steam/steam/logs/compat_log.txt
DIR1=/home/$USER/.steam/steam/logs/
DIR2=/home/$USER/.steam/steam/SteamApps/
DIR3=/media/$USER/CrucialXTB/steam/steamapps/

forced=250
default=100
tool370=proton_37
tool316=proton_316
tool420=proton_42
tool411=proton_411
tool500=proton_5

#IFS=
#set -f
cd $DIR1;
#for line in $(cat $log|grep -o -E 'Mapping.*priority\ 250'|sort -V|uniq)
while read -r line
do
(
    if [[ "$line" == *"priority 250"* ]]
    then
lines=$(echo $line|grep -m 1 -o -E "Mapping.*priority\ 250"|sort -V|uniq)
#echo "$lines";
appidp=$(echo $lines|grep -m 1 -o -E "AppID\ .*to\ tool"|sort -V|uniq|cut -d "D" -f2|cut -d "t" -f1|tr -d " ")
toolp=$(echo $lines|grep -m 1 -o -E "tool\ .*with\ "|sort -V|uniq|cut -d "l" -f2|cut -d "w" -f1|tr -d " ")
pri=$(echo $lines|grep -m 1 -o -E "Mapping.*priority\ 250"|sort -V|uniq|cut -d "y" -f2|tr -d " ")
afilename="appmanifest_"$appidp".acf"
aname=$(grep -o -E '"name".*".*"' "$DIR3$afilename"||exit)
aname2=$(grep -o -E '"name".*".*"' "$DIR2$afilename"||exit)
[ -f "$DIR3$afilename" ] & echo "$DIR3$afilename"|echo "$appidp" "$aname" && echo "$toolp" priority "$pri"||exit 0;
[ -f "$DIR2$afilename" ] & echo "$DIR2$afilename"|echo "$appidp" "$aname2" && echo "$toolp" priority "$pri"||exit 0;
exit 0;
fi
)
done <<<$(cat "$clog"|grep -o -E "Mapping.*priority\ 250"|sort -V|uniq)

grep -o -E 'Mapping.*priority\ 250' $clog|sort -V|uniq

