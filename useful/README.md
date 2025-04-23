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
  `DXVK_FRAME_RATE=60 %command%` limit frame rate to 60fps
* vkd3d uses the above if otherwise use: <br />
  `VKD3D_FRAME_RATE=60 %command%`

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
  other testing has shown that latency interrupts can occur while system processess interrupt the game's processing threads...(stutters or fps lows 1%) <br />

[Ray-Tracing]
* AMD mesa raytracing sometimes requires: <br />
  `RADV_PERFTEST=rt %command%`

[DLSS2FSR]
* replace the game's DLSS to use FSR3 & FG on AMD+LINUX: <br />
  `WINEHAGS=1 WINEDLLOVERRIDES="version,dxgi,nvngx,_nvngx=n,b" %command%` <br />
  possibly requires: <br />
  `PROTON_HIDE_NVIDIA_GPU=0 PROTON_DISABLE_NVAPI=0 PROTON_ENABLE_NVAPI=1 DXVK_ENABLE_NVAPI=1 DXVK_NVAPI_ALLOW_OTHER_DRIVERS=1 LFX2=1` etc. <br />
  ^ proton-experimental and/or bleeding-edge (beta) will support some of these features.
