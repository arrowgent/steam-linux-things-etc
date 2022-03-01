# Linux SDL_Controller:
</br>
for anyone looking to read steam's controller info</br>
`cat $HOME/.steam/steam/config/config.vdf|grep -i platform:Linux`</br>
reports the controller configs in SDL2</br>
`"SDL_GamepadBind"		"steam's sdl controller info here"`</br>
</br>
compare this to what your official system SDL2 reports</br>
`echo $SDL_GAMECONTROLLERCONFIG`</br>
this can be set in `~/.profile` as `export SDL_GAMECONTROLLERCONFIG="your,config,here"`</br>
</br>
use SDL's own tool for verifying and configuring your controller</br>
install `libsdl2-dev` (your distro repo should have this)</br>
then navigate to the folder to run controllermap</br>
`cd /usr/lib/x86_64-linux-gnu/installed-tests/SDL`</br>
or run directly</br>
`exec /usr/lib/x86_64-linux-gnu/installed-tests/SDL2/controllermap`</br>
(arm folder: `/usr/lib/arm-linux-gnueabihf/installed-tests/SDL2`)</br>
</br>
![SDL controllermap](https://github.com/arrowgent/steam-linux-things-etc/blob/master/SDL_controller/sdl_controllermap.png)</br>
</br>
 use this tool to input the buttons requested and it will output the `SDL_GAMECONTROLLERCONFIG` </br>
 
## Resources:
</br>
https://github.com/gabomdq/SDL_GameControllerDB</br>
