#!/bin/bash

#colors
NC='\033[0m'
RED='\033[0;31m'
GRN='\033[0;32m'
YEL='\033[0;33m'
BLUE='\033[0;34m'

#$STEAM
SDIR1=/home/$USER/.steam/steam
SDIR2=$(cat $SDIR1/config/config.vdf|grep  -m 1 -o -E '"BaseInstallFolder_1".*".*"'|cut -f2- -d "/"|sed 's/.$//')
SAPP1="/SteamApps/"
SAPP2="/steamapps/"
LDIR1="$SDIR1$SAPP1"
LDIR2="/$SDIR2$SAPP2"
#LDIR2=$(cat $SDIR/SteamApps/libraryfolders.vdf|grep  -m 1 -o -E '"1".*".*"'|cut -f2- -d "/"|sed 's/.$//')
COMPAT="compatdata/"
PVER1="$LDIR1$COMPAT"
PVER2="$LDIR2$COMPAT"

grepnf="No such file or directory"

#PROTON VERSION
echo -e ${BLUE}$LDIR1${NC}
for verfile in $(find $PVER1 -maxdepth 2 -name "version"|sort -V)
do (
    if [ 'grep -q '.*' "$verfile"' ]
    then
        appidp=$(echo "$verfile" | sed 's/[^0-9]*//g')
        afilename="appmanifest_"$appidp".acf"
        aname1=$(grep -s -o -E '"name".*".*"' $LDIR1$afilename|column -t||exit)
        aname2=$(grep -s -o -E '"name".*".*"' $LDIR2$afilename|column -t||exit)
        versionp=$(cat "$verfile")
        if [[ -f $LDIR1$afilename ]]
        then
                echo -e ${YEL}"$appidp" ' \t ' ${GRN}"$aname1"' \t ' ${RED}proton version: "$versionp"${NC}||exit 0;
        else
                echo -e ${YEL}"$appidp" ' \t ' ${GRN}"$aname2" ' \t ' ${RED}proton version: "$versionp"${NC}||exit 0;
        fi
        exit 0;
fi
)
done

echo -e ${BLUE}$LDIR2${NC}
for verfile in $(find $PVER2 -maxdepth 2 -name "version"|sort -V)
do (
    if [ 'grep -q '.*' "$verfile"' ]
    then
        appidp=$(echo "$verfile" | sed 's/[^0-9]*//g')
        afilename="appmanifest_"$appidp".acf"
        aname1=$(grep -s -o -E '"name".*".*"' "$LDIR1$afilename"|column -t||exit)
        aname2=$(grep -s -o -E '"name".*".*"' "$LDIR2$afilename"|column -t||exit)
        versionp=$(cat "$verfile")
        if [[ -f $LDIR2$afilename ]]
        then
                echo -e ${YEL}"$appidp" ' \t ' ${GRN}"$aname2" ' \t ' ${RED}proton version: "$versionp"${NC}||exit 0;
        else 
                echo -e ${YEL}"$appidp" ' \t ' ${GRN}"$aname1" ' \t ' ${RED}proton version: "$versionp"${NC}||exit 0;
        fi
        exit 0;
fi
)
done
