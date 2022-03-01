# Proton List:

![protonlist](https://github.com/arrowgent/steam-linux-things-etc/blob/master/protonlist/img_protonlist.png) </br>

1) [protonlist.sh](https://github.com/arrowgent/steam-linux-things-etc/blob/master/protonlist/protonlist.sh) </br>
first iteration of this list examines your installed games `appmanifest_#.acf` and the compatdata pfx folder for the _LAST RUN_ condition </br>
ex: `version` = `7.0-100`

2) [OLD_protonlog.sh](https://github.com/arrowgent/steam-linux-things-etc/blob/master/protonlist/OLD_protonlog.sh) </br>
only examines the current `compat_log.txt` from steam for changes to proton settings.  does not report older changes than this log. </br>
its possible for this log to be empty of proton changes.

3) [p2vdf.sh](https://github.com/arrowgent/steam-linux-things-etc/blob/master/protonlist/p2vdf.sh) </br>
steam moved proton data to config.vdf, this reads the data and formats it.  steam does not always put "name" of the appid, sometimes reported blank.


# p2vdf

its recommended to use [p2vdf.sh](https://github.com/arrowgent/steam-linux-things-etc/blob/master/protonlist/p2vdf.sh) because its the latest and possibly correctly reports the current setting in your compatibility properties. </br>
the others are left here as legacy for examples and experimenting.
