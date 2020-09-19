# [steam-linux-things-etc](https://github.com/arrowgent/steam-linux-things-etc)
various simple scripts for managing steam QOL.

<img src="https://i.imgur.com/sWs4BZc.png" />

1) Start steam [offline](https://github.com/arrowgent/steam-linux-things-etc/tree/master/offline) without login. </br>
modifies file `/home/$USER/.steam/steam/config/loginusers.vdf`

2) Script to set [Auto-update](https://github.com/arrowgent/steam-linux-things-etc/tree/master/noupdate) for ALL games/tools to OFF. </br>
modifies all files `/home/$USER/.steam/steam/SteamApps/appmanifest_####.acf`

3) Script which finds installed games and shows the LAST RUN [proton version](https://github.com/arrowgent/steam-linux-things-etc/tree/master/protonlist). </br>
does not modify any files, only reads data and prints the results.
<img src="https://steamuserimages-a.akamaihd.net/ugc/1474318323593725418/CBB727346C2771FCFAC932FCFEC2E4CE39632B37/" />

4) Shell script to change maximum download throttle other than steam's defaults (ex: 10mbs or 25mbs) </br>
usage: `./throttdl.sh 50` would set to throttle of 50MB/s </br>
modifies the file `/home/$USER/.steam/steam/config/config.vdf` </br>
obsolete, this was put into steam beta update: 9/11/2020

5) TBD.
