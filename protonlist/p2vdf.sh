#!/bin/bash
# steam now stores your proton settings in config.vdf

#colors
NC='\033[0m'
RED='\033[0;31m'
GRN='\033[0;32m'
YEL='\033[0;33m'
BLUE='\033[0;34m'

#$STEAM
SDIR1="/home/$USER/.steam"
#SDIR2=$(cat $SDIR1/steam/config/config.vdf|grep  -m 1 -o -E '"BaseInstallFolder_1".*".*"'|cut -f2- -d "/"|sed 's/.$//')
CDIR="/steam/config/config.vdf"
RDIR="/registry.vdf"
#grep only proton, add compatibility options
CLINE=$(cat $SDIR1$CDIR|tr -d '\n'|sed -e 's/\"\s*/\"/g' -e 's/[{}]\s*//g'|sed 's/^.*\"CompatToolMapping/\"CompatToolMapping/'|sed "s/\"ipv6check.*//"|sed -e 's/\"250\"/\"250\"\n/g' -e 's/\"75\"/\"75\"\n/g'|sed -e 's/\"config"""//g' -e 's/\"Priority""250"//g'|sort -V|grep -i "proton")
RLINE=$(cat $SDIR1$RDIR|tr -d '\n'|sed -e 's/\"\s*/\"/g'|sed 's/^.*\"Apps"/\"Apps"/'|sed "s/\"RunningAppID.*//"|sed -e 's/[{]\s*//g' -e 's/[}]\s*/\n/g'|sed -e 's/\"Updating""[01]"//g' -e 's/\"Running""[01]"//g'|sort -V)
#SAPP1="/steamapps/"
#SAPP2="/steamapps/"
#LDIR1="$SDIR1$SAPP1"
#LDIR2="/$SDIR2$SAPP2"
##LDIR2=$(cat $SDIR/SteamApps/libraryfolders.vdf|grep  -m 1 -o -E '"1".*".*"'|cut -f2- -d "/"|sed 's/.$//')
#COMPAT="compatdata/"
#PVER1="$LDIR1$COMPAT"
#PVER2="$LDIR2$COMPAT"

#grepnf="No such file or directory"

#PROTON VERSION by config.vdf
echo -e ${BLUE}$SDIR1$CDIR${NC}
for line in $CLINE
do (
    pconfappid=$(echo "$line"|sed 's/\""name".*//'|tr -d '"')
    pconfver=$(echo "$line"|sed 's/.*\"name"//'|sed 's/^"name""//'|tr -d '"')
    rconfappid=$(echo "$RLINE"|grep -o -e \"$pconfappid\")
    rconfname=$(echo "$RLINE"|grep -e \"$pconfappid\"|sed 's/.*\"name"//'|sed 's/^"name""//'|tr -d '"')

# build if statement to read name from .acf file in library folder replacing $rconfname
# the registry.vdf doesnt store all the names of the game for some reason
#    echo $line;
#    echo $CLINE;
#    echo $RLINE;
    echo -e ${YEL}"$rconfappid" ' \t ' ${GRN}"$rconfname" ' \t\t ' ${RED}"$pconfver"${NC}||exit 0;
)
done

# show proton setting in config
echo "cat ~/.steam/steam/config/config.vdf| \
tr -d '\n'| \
sed -e 's/\"\s*/\"/g' -e 's/[{}]\s*//g'| \
sed 's/^.*\"CompatToolMapping/\"CompatToolMapping/'| \
sed 's/\"ipv6check.*//'| \
sed -e 's/\"250\"/\"250\"\n/g' -e 's/\"75\"/\"75\"\n/g'| \
sed -e 's/\"config"""//g' -e 's/\"Priority""250"//g'| \
sort -V"

# compare to proton appid name in registry
echo "cat ~/.steam/registry.vdf| \
tr -d '\n'| \
sed -e 's/\"\s*/\"/g'| \
sed 's/^.*\"Apps"/\"Apps"/'| \
sed 's/\"RunningAppID.*//'| \
sed -e 's/[{]\s*//g' -e 's/[}]\s*/\n/g'| \
sed -e 's/\"Updating""[01]"//g' -e 's/\"Running""[01]"//g'| \
sort -V"
