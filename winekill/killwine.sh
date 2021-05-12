#!/bin/bash

#find wine processes and list them
ls -l /proc/*/exe 2>/dev/null | grep -E 'wine'
ps -e | grep "wine"
pgrep -l '.exe'

#kill the most common wine processes
killall taskmgr.exe
killall taskmgr
killall services.exe
killall mscorsvw.exe
killall mscorsvw
killall winedevices.exe
killall winedevices
killall winedevice.exe
killall winedevice
killall plugplay.exe
killall plugplay
killall explorer.exe
killall explorer
killall winetricks
killall wineserver
killall wine
killall wine64
killall wine-preloader
killall wine64-preloader
killall winedbg
killall pressure-vessel-adverb
killall pressure-vessel-launcher

# optional -k for wine
# $USER/.steam/steam/steamapps/common/Proton\ 5.0/dist/bin/wineserver -k9

#list the wine processes again to verify nothing is running
ls -l /proc/*/exe 2>/dev/null | grep -E 'wine'
pgrep -l '.exe'
kill -9 `ps -ef | egrep '\.exe'|awk '{print $2}'`
