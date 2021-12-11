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

3) [new: steam is storing custom proton settings in your config.vdf](https://github.com/arrowgent/steam-linux-things-etc/blob/master/protonlist/p2vdf.sh) </br>
does not modify any files or create any files, reads config.vdf and registry.vdf and formats the output

4) Shell script to change maximum download [throttle](https://github.com/arrowgent/steam-linux-things-etc/tree/master/throttdl) other than steam's defaults (ex: 10mbs or 25mbs) </br>
usage: `./throttdl.sh 50` would set to throttle of 50MB/s </br>
modifies the file `/home/$USER/.steam/steam/config/config.vdf` </br>
obsolete, this was put into steam beta update: 9/11/2020

5) Shell script to [kill](https://github.com/arrowgent/steam-linux-things-etc/tree/master/winekill) all running wine processes (proton) </br>
to handle this i create a desktop/panel application launcher that runs this script quickly. </br>
does not modify any files, just kills (closes) the processes related to wine.

6) TBD.

# [LICENSE](https://github.com/arrowgent/steam-linux-things-etc/LICENSE.md)

No relation to Valve, Steam, Proton, Wine, Vulkan, or other works derived from tools provided by any company or 3rd party. </br>
No intent for circumvention or counterfeiting any sort of software exists in these simple script tools.</br>
