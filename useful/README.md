useful linux & steam commands & evironment variables <br />
`%command%` can be replaced with `"$@"` or the program name eg: `glxgears` for non steam launch options.

[PROTON]
* sometimes fixes video media issues with WMF (MF) codecs: <br />
`WINE_DO_NOT_CREATE_DXGI_DEVICE_MANAGER=1 %command%`	Enable hack to work around video issues in some games due to incomplete IMFDXGIDeviceManager support (mfobjects.h).
* if dxvk or vkd3d fails use wine opengl: <br />
`PROTON_USE_WINED3D=1 %command%`
* use D8VK in DXVK: <br />
`PROTON_DXVK_D3D8=1 %command%`

[DXVK]
* dx9,10,11 show FPS: <br />
  `DXVK_HUD=fps,scale=0.75 %command%` show FPS and scaled to 0.75% font size <br />
  ^ vkd3d does not have an on screen hud showing FPS
* dxvk limit fps: <br />
  ~~DXVK_FRAME_RATE=60 %command%~~ limit frame rate to 60fps <br />
  `DXVK_CONFIG="dxgi.maxFrameRate = 60; d3d9.maxFrameRate = 60" %command%` <br />
  `DXVK_CONFIG="dxgi.maxFrameRate = 60" %command%` 
* vkd3d uses the above if otherwise use: <br />
  `VKD3D_FRAME_RATE=60 %command%`

[MANGOHUD]
* api overlay for games
  basic frame rate limiting: <br />
  `MANGOHUD_CONFIG=no_display,fps_limit=60 mangohud %command%` <br />
  `MANGOHUD_FPS_LIMIT=60 mangohud %command%` new env var soon

[LIBSTRANGLE]
* opengl & vulkan frame limiter -- [unmaintained](https://gitlab.com/torkel104/libstrangle/) <br />
  `strangle 60 %command%`

[WINE]
* environment variable for wine or proton to limit cpu cores/threads being used: <br />
  `WINE_CPU_TOPOLOGY=8:0,1,2,3,4,5,6,7 %command%` <br />
  or <br />
  `export WINE_CPU_TOPOLOGY=8:0,1,2,3,4,5,6,7` in your `~/.profile` file to make it a user environment variable (logon, restart required to enable)
* "pixel perfect" scaling, useful for some pixel art games: <br />
  `WINE_FULLSCREEN_INTEGER_SCALING=1 %command%`
  
[OPENGL]
* amd gallium mesa openGL FPS: <br />
  `GALLIUM_HUD=simple,fps+cpu %command%`
* mesa opengl FPS:
  `__GL_SHOW_GRAPHICS_OSD=1 %command%`

[VULKAN]
* amd mesa or nvidia mesa vulkan FPS: <br />
  `VK_INSTANCE_LAYERS=VK_LAYER_MESA_overlay VK_LAYER_MESA_OVERLAY_CONFIG=fps,format=0,frame_timing=0 %command%`

[LINUX]
* if wine topology fails then use taskset limiting cpu cores: <br />
  `taskset -c 0,1,2,3,4,5,6,7 %command%` <br />
  or <br />
  `taskset -c 0-7 %command%` <br />
  ^ useful to move games off cores 0 & 1, as most system processes prefer the first cores.  can be used on CCD or CCX amd cpu which split cores or split L3 cache, OR performance cores vs efficiency cores. (see lstopo) <br />
  personally i set wine_topography and taskset to `4,5,6,7,8,9,10,11` ie: `4-11` which are the middle first cores of CCD0 (of a 16 core 32 thread cpu) leaving 0,1,2,3 & 12,13,14,15 open for other tasks. <br />
  further, moving things such as desktop processess, audio, OBS, and BASH to `16-31` (CCD1) keeps those processes off the game's cpu threads.
  other testing has shown that latency interrupts can occur while system processess interrupt the game's processing threads...(stutters or fps lows 1%) 

[Monitor]
* X11 change a 16:9 display into 4:3 for retro games and screen capture (eg: 1440x1080) <br />
```
cvt 1440 1080
Modeline "1440x1080_60.00"  129.00  1440 1528 1680 1920  1080 1083 1087 1120 -hsync +vsync
```

`xrandr --newmode $(cvt 1440 1080|grep Modeline|sed 's/\Modeline //g')` <br />

```
xrandr --newmode "1440x1080_60.00"  129.00  1440 1528 1680 1920  1080 1083 1087 1120 -hsync +vsync
xrandr --addmode 'HDMI-1' '1440x1080_60.00'
xrandr --output 'HDMI-1' --mode '1440x1080_60.00'
xrandr --output 'HDMI-1' --mode '1440x1080_60.00' --scale-from '1440x1080' --set "scaling mode" "Center"
```

* futher, scaling UP resolution from a monitor.  eg: 1080p monitor to 1440p output <br />

```
xrandr --output 'HDMI-1' --mode '1920x1080' --scale-from '2560x1440' --scale '1920x1080' --set "scaling mode" "Center"
```

[Ray-Tracing]
* AMD mesa raytracing sometimes requires: <br />
  `RADV_PERFTEST=rt %command%`

~~[DLSS2FSR]~~
~~* replace the game's DLSS to use FSR3 & FG on AMD+LINUX: <br />
  `WINEHAGS=1 WINEDLLOVERRIDES="version,dxgi,nvngx,_nvngx=n,b" %command%` <br />
  possibly requires: <br />
  `PROTON_HIDE_NVIDIA_GPU=0 PROTON_DISABLE_NVAPI=0 PROTON_ENABLE_NVAPI=1 DXVK_ENABLE_NVAPI=1 DXVK_NVAPI_ALLOW_OTHER_DRIVERS=1 LFX2=1` etc. <br />
  ^ proton-experimental and/or bleeding-edge (beta) will support some of these features.~~

[Optiscaler]
* inject wine/proton libraries to override game's upscaler and framegeneration options <br />
  can be used on AMD RNDA3 gfx1100 navi31 etc gpu to enable FSR4 FP8 and INT8 upscaler models <br />
  requires `Mesa 25.2.0` or higher, and a proton variant that enabled support for FSR4<br />
  extract optiscaler as instructed, setup steam launch options as instructed, test and verify with the Opti-menu while in game.

[Launch Options]
* some option tricks to do various things: <br />

* steamdeck appimage and various builtin tool (may require steam linux runtime) <br />
```
APPIMAGE_EXTRACT_AND_RUN=1 %command%
```

* run a linux script (linux game) within a windows only proton game! <br />
```
exec /run/some/script/app/executable/binary ; #%command%
or
/run/folder/thing/script.sh ; #%command%
```


[SteamGuard 2FA]
* [steamguard-cli](https://github.com/dyc3/steamguard-cli) <br />
`https://github.com/dyc3/steamguard-cli` <br />
steamguard command line interface for generating 2FA login codes using your manifest credentials <br />
steamguard can also verify marketplace trades (no steam phone app required!)
