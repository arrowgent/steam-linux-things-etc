# [steam-linux-things-etc](https://codeberg.org/arrowgent/steam-linux-things-etc)
various simple scripts for managing steam QOL.

![steam_red](https://github.com/arrowgent/steam-linux-things-etc/blob/master/img_steamred.png) </br>

1) Start steam [offline](https://codeberg.org/arrowgent/steam-linux-things-etc/src/branch/master/offline) without login. </br>
modifies file `/home/$USER/.steam/steam/config/loginusers.vdf`

2) Script to set [Auto-update](https://codeberg.org/arrowgent/steam-linux-things-etc/src/branch/master/noupdate) for ALL games/tools to OFF. </br>
modifies all files `/home/$USER/.steam/steam/SteamApps/appmanifest_####.acf` </br>
**steam must be off/closed/exited then started for this to take effect** </br>
obsolete, this was put into steam beta update: 12/11/2024 (stable 1/20/2025) </br>
Added a global setting for improved management of game updates.

3) Script which finds installed games and shows the LAST RUN [proton version](https://codeberg.org/arrowgent/steam-linux-things-etc/src/branch/master/protonlist). </br>
does not modify any files, only reads data and prints the results.
![protonlist](https://github.com/arrowgent/steam-linux-things-etc/blob/master/protonlist/img_protonlist.png) </br>

4) [new: steam is storing custom proton settings in your config.vdf](https://codeberg.org/arrowgent/steam-linux-things-etc/src/branch/master/protonlist/p2vdf.sh) </br>
does not modify any files or create any files, reads config.vdf and registry.vdf and formats the output </br>
WIP, registry.vdf strangely does not store all the game appid names

5) Shell script to change maximum download [throttle](https://codeberg.org/arrowgent/steam-linux-things-etc/src/branch/master/throttdl) other than steam's defaults (ex: 10mbs or 25mbs) </br>
usage: `./throttdl.sh 50` would set to throttle of 50MB/s </br>
modifies the file `/home/$USER/.steam/steam/config/config.vdf` </br>
obsolete, this was put into steam beta update: 9/11/2020

6) Shell script to [kill](https://codeberg.org/arrowgent/steam-linux-things-etc/src/branch/master/winekill) all running wine processes (proton) </br>
to handle this i create a desktop/panel application launcher that runs this script quickly. </br>
does not modify any files, just kills (closes) the processes related to wine.

7) SDL2 [controller](https://codeberg.org/arrowgent/steam-linux-things-etc/src/branch/master/SDL_controller) mapping info for steam & system

8) [proton versions](https://codeberg.org/arrowgent/steam-linux-things-etc/src/branch/master/proton_ver) appid list

9) [useful tricks](https://codeberg.org/arrowgent/steam-linux-things-etc/src/branch/master/useful/README.md) many linux system and steam tricks

10) TBD.

# [LICENSE](https://codeberg.org/arrowgent/steam-linux-things-etc/src/branch/master/LICENSE.md)

No relation to Valve, Steam, Proton, Wine, Vulkan, or other works derived from tools provided by any company or 3rd party. </br>
No intent for circumvention or counterfeiting any sort of software exists in these simple script tools.</br>
