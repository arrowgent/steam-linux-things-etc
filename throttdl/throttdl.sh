#!/bin/sh

NC='\033[0m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YEL='\033[0;33m'
GRN='\033[0;32m'

KBITS=$(($1\*1024\*8))
SDIR1=/home/$USER/.steam/steam/config

echo test if setting is "" instead of number and set to "0"
for filename in $SDIR1/config.vdf
do (
    if [ 'grep -q '"DownloadThrottleKbps"' "$filename"' ]
    then
	echo -e ${YEL}"$filename";
	grep --color=always "DownloadThrottleKbps" "$filename";
        cat "$filename"|grep -q '"DownloadThrottleKbps".*""' && sed -i -s '/"DownloadThrottleKbps".*""/ s/""/"0"/g' "$filename";
        exit 0;
fi
)
done

echo current value is:
cat $SDIR1/config.vdf |grep '"DownloadThrottleKbps"'
echo changing to $1MB\/s or: $KBITS
for filename in $SDIR1/config.vdf
do (
    echo -e ${YEL}"$filename";
    grep --color=always "DownloadThrottleKbps" "$filename";
    cat "$filename"|grep -q '"DownloadThrottleKbps".*".*"' && sed -i -s '/"DownloadThrottleKbps".*".*"/ s/[0-9]\+/'"$KBITS"'/g' "$filename";
    exit 0;
)
done
cat $SDIR1/config.vdf |grep '"DownloadThrottleKbps"'
echo if steam is running need to restart steam
