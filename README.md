# install-GLFW


- [使用例](#使用例)
    - [build example](#build-example)
    - [check version](#check-version)
- [undefined reference to](#undefined-reference-to)


## 使用例

### build example

```
$ make GLFW_VERSION=3.1.2
$ make GLFW_VERSION=3.2.1
```

### check version

```
 % make check_version GLFW_VERSION=3.1.2
g++ -g -Wall -std=c++11    check_version.cpp -I/home/pollenjp/.glfw/install/GLFW-3.1.2/include -L/home/pollenjp/.glfw/install/GLFW-3.1.2/lib -lglfw3 -ldl -lX11 -lXxf86vm -lXinerama -lXrandr -lXcursor -lXi -lpthread -o check_version
 % ./check_version 
GLFW version     : 3.1.2 X11 GLX clock_gettime /dev/js XI Xf86vm
Major version    : 3
Minor version    : 1
Subminor version : 2
 % make clean         
rm -f check_version check_version.o *~ .*~ core
 % make check_version GLFW_VERSION=3.2.1
g++ -g -Wall -std=c++11    check_version.cpp -I/home/pollenjp/.glfw/install/GLFW-3.2.1/include -L/home/pollenjp/.glfw/install/GLFW-3.2.1/lib -lglfw3 -ldl -lX11 -lXxf86vm -lXinerama -lXrandr -lXcursor -lXi -lpthread -o check_version
 % ./check_version 
GLFW version     : 3.2.1 X11 GLX EGL clock_gettime /dev/js Xf86vm
Major version    : 3
Minor version    : 2
Subminor version : 1
```


## undefined reference to

「`'XXX'に対する定義されていない参照です`」というエラーに見舞われたら「undefined reference t2 XXX」でGoogle検索すればだいたい何のライブラリ参照をすればいいか(`-l`)が大体わかる.
これは`glfw3`が他のライブラリに依存していることによって生じるエラー

- [c++ - Linker error on GLFW on linux (x11) - Stack Overflow](https://stackoverflow.com/questions/48819869/linker-error-on-glfw-on-linux-x11)
- [Undefined References Compiling OpenGL/glfw/glew on Ubuntu(g++) - Stack Overflow](https://stackoverflow.com/questions/29459664/undefined-references-compiling-opengl-glfw-glew-on-ubuntug)

```
g++ -g -Wall -std=c++11    check_version.cpp -I/home/pollenjp/.glfw/install/GLFW-3.2.1/include -L/home/pollenjp/.glfw/install/GLFW-3.2.1/lib -lglfw3 -o check_version
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(vulkan.c.o): 関数 `_glfwInitVulkan' 内:
vulkan.c:(.text+0x4a): `dlopen' に対する定義されていない参照です
vulkan.c:(.text+0x95): `dlsym' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(vulkan.c.o): 関数 `_glfwTerminateVulkan' 内:
vulkan.c:(.text+0x496): `dlclose' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(vulkan.c.o): 関数 `glfwGetInstanceProcAddress' 内:
vulkan.c:(.text+0x803): `dlsym' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_init.c.o): 関数 `translateKeyCode' 内:
x11_init.c:(.text+0x6a): `XkbKeycodeToKeysym' に対する定義されていない参照です
x11_init.c:(.text+0x14a): `XkbKeycodeToKeysym' に対する定義されていない参照です
x11_init.c:(.text+0x177): `XGetKeyboardMapping' に対する定義されていない参照です
x11_init.c:(.text+0x191): `XFree' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_init.c.o): 関数 `createKeyTables' 内:
x11_init.c:(.text+0xc3e): `XkbGetMap' に対する定義されていない参照です
x11_init.c:(.text+0xc61): `XkbGetNames' に対する定義されていない参照です
x11_init.c:(.text+0x137e): `XkbFreeNames' に対する定義されていない参照です
x11_init.c:(.text+0x1394): `XkbFreeKeyboard' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_init.c.o): 関数 `hasUsableInputMethodStyle' 内:
x11_init.c:(.text+0x14ac): `XGetIMValues' に対する定義されていない参照です
x11_init.c:(.text+0x1506): `XFree' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_init.c.o): 関数 `getSupportedAtom' 内:
x11_init.c:(.text+0x1555): `XInternAtom' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_init.c.o): 関数 `detectEWMH' 内:
x11_init.c:(.text+0x15e4): `XInternAtom' に対する定義されていない参照です
x11_init.c:(.text+0x160a): `XInternAtom' に対する定義されていない参照です
x11_init.c:(.text+0x1653): `XFree' に対する定義されていない参照です
x11_init.c:(.text+0x168e): `XFree' に対する定義されていない参照です
x11_init.c:(.text+0x16a7): `XFree' に対する定義されていない参照です
x11_init.c:(.text+0x16d0): `XFree' に対する定義されていない参照です
x11_init.c:(.text+0x16dc): `XFree' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_init.c.o):x11_init.c:(.text+0x16ed): `XFree' に対する定義されていない参照がさらに続いています
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_init.c.o): 関数 `initExtensions' 内:
x11_init.c:(.text+0x196d): `XF86VidModeQueryExtension' に対する定義されていない参照です
x11_init.c:(.text+0x19ae): `XRRQueryExtension' に対する定義されていない参照です
x11_init.c:(.text+0x19e8): `XRRQueryVersion' に対する定義されていない参照です
x11_init.c:(.text+0x1a75): `XRRGetScreenResources' に対する定義されていない参照です
x11_init.c:(.text+0x1aa8): `XRRGetCrtcGammaSize' に対する定義されていない参照です
x11_init.c:(.text+0x1adf): `XRRFreeScreenResources' に対する定義されていない参照です
x11_init.c:(.text+0x1b0b): `XRRSelectInput' に対する定義されていない参照です
x11_init.c:(.text+0x1b3d): `XineramaQueryExtension' に対する定義されていない参照です
x11_init.c:(.text+0x1b57): `XineramaIsActive' に対する定義されていない参照です
x11_init.c:(.text+0x1bea): `XkbQueryExtension' に対する定義されていない参照です
x11_init.c:(.text+0x1c29): `XkbSetDetectableAutoRepeat' に対する定義されていない参照です
x11_init.c:(.text+0x1c56): `dlopen' に対する定義されていない参照です
x11_init.c:(.text+0x1c97): `dlsym' に対する定義されていない参照です
x11_init.c:(.text+0x1cd4): `XInternAtom' に対する定義されていない参照です
x11_init.c:(.text+0x1d07): `XInternAtom' に対する定義されていない参照です
x11_init.c:(.text+0x1d3a): `XInternAtom' に対する定義されていない参照です
x11_init.c:(.text+0x1d6d): `XInternAtom' に対する定義されていない参照です
x11_init.c:(.text+0x1da0): `XInternAtom' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_init.c.o):x11_init.c:(.text+0x1dd3): `XInternAtom' に対する定義されていない参照がさらに続いています
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_init.c.o): 関数 `_glfwGrabErrorHandlerX11' 内:
x11_init.c:(.text+0x2364): `XSetErrorHandler' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_init.c.o): 関数 `_glfwReleaseErrorHandlerX11' 内:
x11_init.c:(.text+0x2386): `XSync' に対する定義されていない参照です
x11_init.c:(.text+0x2390): `XSetErrorHandler' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_init.c.o): 関数 `_glfwInputErrorX11' 内:
x11_init.c:(.text+0x23e9): `XGetErrorText' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_init.c.o): 関数 `_glfwCreateCursorX11' 内:
x11_init.c:(.text+0x244f): `XcursorImageCreate' に対する定義されていない参照です
x11_init.c:(.text+0x257c): `XcursorImageLoadCursor' に対する定義されていない参照です
x11_init.c:(.text+0x258c): `XcursorImageDestroy' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_init.c.o): 関数 `_glfwPlatformInit' 内:
x11_init.c:(.text+0x259f): `XInitThreads' に対する定義されていない参照です
x11_init.c:(.text+0x25a9): `XOpenDisplay' に対する定義されていない参照です
x11_init.c:(.text+0x2686): `XrmUniqueQuark' に対する定義されていない参照です
x11_init.c:(.text+0x26c3): `XSupportsLocale' に対する定義されていない参照です
x11_init.c:(.text+0x26d7): `XSetLocaleModifiers' に対する定義されていない参照です
x11_init.c:(.text+0x26fc): `XOpenIM' に対する定義されていない参照です
x11_init.c:(.text+0x273f): `XCloseIM' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_init.c.o): 関数 `_glfwPlatformTerminate' 内:
x11_init.c:(.text+0x27aa): `dlclose' に対する定義されていない参照です
x11_init.c:(.text+0x27f6): `XFreeCursor' に対する定義されていない参照です
x11_init.c:(.text+0x2847): `XCloseIM' に対する定義されていない参照です
x11_init.c:(.text+0x2887): `XCloseDisplay' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_monitor.c.o): 関数 `_glfwSetVideoModeX11' 内:
x11_monitor.c:(.text+0x332): `XRRGetScreenResources' に対する定義されていない参照です
x11_monitor.c:(.text+0x361): `XRRGetCrtcInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0x390): `XRRGetOutputInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0x4be): `XRRSetCrtcConfig' に対する定義されていない参照です
x11_monitor.c:(.text+0x4ce): `XRRFreeOutputInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0x4da): `XRRFreeCrtcInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0x4e6): `XRRFreeScreenResources' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_monitor.c.o): 関数 `_glfwRestoreVideoModeX11' 内:
x11_monitor.c:(.text+0x596): `XRRGetScreenResources' に対する定義されていない参照です
x11_monitor.c:(.text+0x5c2): `XRRGetCrtcInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0x632): `XRRSetCrtcConfig' に対する定義されていない参照です
x11_monitor.c:(.text+0x642): `XRRFreeCrtcInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0x64e): `XRRFreeScreenResources' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_monitor.c.o): 関数 `_glfwPlatformGetMonitors' 内:
x11_monitor.c:(.text+0x6e1): `XRRGetScreenResources' に対する定義されていない参照です
x11_monitor.c:(.text+0x70c): `XRRGetOutputPrimary' に対する定義されていない参照です
x11_monitor.c:(.text+0x758): `XineramaQueryScreens' に対する定義されていない参照です
x11_monitor.c:(.text+0x79d): `XRRGetCrtcInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0x7e2): `XRRGetOutputInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0x7ff): `XRRFreeOutputInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0x997): `XRRFreeOutputInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0xa38): `XRRFreeCrtcInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0xa58): `XRRFreeScreenResources' に対する定義されていない参照です
x11_monitor.c:(.text+0xa6b): `XFree' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_monitor.c.o): 関数 `_glfwPlatformGetMonitorPos' 内:
x11_monitor.c:(.text+0xbfa): `XRRGetScreenResourcesCurrent' に対する定義されていない参照です
x11_monitor.c:(.text+0xc26): `XRRGetCrtcInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0xc5e): `XRRFreeCrtcInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0xc6a): `XRRFreeScreenResources' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_monitor.c.o): 関数 `_glfwPlatformGetVideoModes' 内:
x11_monitor.c:(.text+0xce7): `XRRGetScreenResourcesCurrent' に対する定義されていない参照です
x11_monitor.c:(.text+0xd13): `XRRGetCrtcInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0xd3f): `XRRGetOutputInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0xe82): `XRRFreeOutputInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0xe8e): `XRRFreeCrtcInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0xe9a): `XRRFreeScreenResources' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_monitor.c.o): 関数 `_glfwPlatformGetVideoMode' 内:
x11_monitor.c:(.text+0xf57): `XRRGetScreenResourcesCurrent' に対する定義されていない参照です
x11_monitor.c:(.text+0xf83): `XRRGetCrtcInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0xfdb): `XRRFreeCrtcInfo' に対する定義されていない参照です
x11_monitor.c:(.text+0xfe7): `XRRFreeScreenResources' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_monitor.c.o): 関数 `_glfwPlatformGetGammaRamp' 内:
x11_monitor.c:(.text+0x1136): `XRRGetCrtcGammaSize' に対する定義されていない参照です
x11_monitor.c:(.text+0x1160): `XRRGetCrtcGamma' に対する定義されていない参照です
x11_monitor.c:(.text+0x11ec): `XRRFreeGamma' に対する定義されていない参照です
x11_monitor.c:(.text+0x1230): `XF86VidModeGetGammaRampSize' に対する定義されていない参照です
x11_monitor.c:(.text+0x1293): `XF86VidModeGetGammaRamp' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_monitor.c.o): 関数 `_glfwPlatformSetGammaRamp' 内:
x11_monitor.c:(.text+0x12f2): `XRRAllocGamma' に対する定義されていない参照です
x11_monitor.c:(.text+0x1395): `XRRSetCrtcGamma' に対する定義されていない参照です
x11_monitor.c:(.text+0x13a1): `XRRFreeGamma' に対する定義されていない参照です
x11_monitor.c:(.text+0x1405): `XF86VidModeSetGammaRamp' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `waitForVisibilityNotify' 内:
x11_window.c:(.text+0x3cc): `XCheckTypedWindowEvent' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `getWindowState' 内:
x11_window.c:(.text+0x463): `XFree' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `findWindowByHandle' 内:
x11_window.c:(.text+0x65b): `XFindContext' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `sendEventToWM' 内:
x11_window.c:(.text+0x789): `XSendEvent' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `updateNormalHints' 内:
x11_window.c:(.text+0x7b7): `XAllocSizeHints' に対する定義されていない参照です
x11_window.c:(.text+0x966): `XSetWMNormalHints' に対する定義されていない参照です
x11_window.c:(.text+0x972): `XFree' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `updateWindowMode' 内:
x11_window.c:(.text+0xafa): `XChangeWindowAttributes' に対する定義されていない参照です
x11_window.c:(.text+0xb5d): `XChangeProperty' に対する定義されていない参照です
x11_window.c:(.text+0xbbf): `XDeleteProperty' に対する定義されていない参照です
x11_window.c:(.text+0xc6a): `XChangeWindowAttributes' に対する定義されていない参照です
x11_window.c:(.text+0xcb0): `XDeleteProperty' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `updateCursorImage' 内:
x11_window.c:(.text+0xf75): `XDefineCursor' に対する定義されていない参照です
x11_window.c:(.text+0xf9b): `XUndefineCursor' に対する定義されていない参照です
x11_window.c:(.text+0xfcf): `XDefineCursor' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `createNativeWindow' 内:
x11_window.c:(.text+0x1037): `XCreateColormap' に対する定義されていない参照です
x11_window.c:(.text+0x10e4): `XCreateWindow' に対する定義されていない参照です
x11_window.c:(.text+0x1164): `XSaveContext' に対する定義されていない参照です
x11_window.c:(.text+0x11db): `XChangeProperty' に対する定義されていない参照です
x11_window.c:(.text+0x132d): `XChangeProperty' に対する定義されていない参照です
x11_window.c:(.text+0x1382): `XSetWMProtocols' に対する定義されていない参照です
x11_window.c:(.text+0x13da): `XChangeProperty' に対する定義されていない参照です
x11_window.c:(.text+0x1466): `XChangeProperty' に対する定義されていない参照です
x11_window.c:(.text+0x146f): `XAllocWMHints' に対する定義されていない参照です
x11_window.c:(.text+0x14ea): `XSetWMHints' に対する定義されていない参照です
x11_window.c:(.text+0x14f9): `XFree' に対する定義されていない参照です
x11_window.c:(.text+0x1534): `XAllocClassHint' に対する定義されていない参照です
x11_window.c:(.text+0x1594): `XSetClassHint' に対する定義されていない参照です
x11_window.c:(.text+0x15a3): `XFree' に対する定義されていない参照です
x11_window.c:(.text+0x160e): `XChangeProperty' に対する定義されていない参照です
x11_window.c:(.text+0x1699): `XCreateIC' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `writeTargetToProperty' 内:
x11_window.c:(.text+0x1849): `XChangeProperty' に対する定義されていない参照です
x11_window.c:(.text+0x1984): `XChangeProperty' に対する定義されていない参照です
x11_window.c:(.text+0x1a0b): `XChangeProperty' に対する定義されていない参照です
x11_window.c:(.text+0x1a1b): `XFree' に対する定義されていない参照です
x11_window.c:(.text+0x1a93): `XChangeProperty' に対する定義されていない参照です
x11_window.c:(.text+0x1b3a): `XChangeProperty' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `handleSelectionRequest' 内:
x11_window.c:(.text+0x1ca4): `XSendEvent' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `pushSelectionToManager' 内:
x11_window.c:(.text+0x1d2a): `XConvertSelection' に対する定義されていない参照です
x11_window.c:(.text+0x1da9): `XCheckIfEvent' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `acquireMonitor' 内:
x11_window.c:(.text+0x1e51): `XGetScreenSaver' に対する定義されていない参照です
x11_window.c:(.text+0x1e7c): `XSetScreenSaver' に対する定義されていない参照です
x11_window.c:(.text+0x1f40): `XMoveResizeWindow' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `releaseMonitor' 内:
x11_window.c:(.text+0x2032): `XSetScreenSaver' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `processEvent' 内:
x11_window.c:(.text+0x2175): `XFilterEvent' に対する定義されていない参照です
x11_window.c:(.text+0x21b8): `XRRUpdateConfiguration' に対する定義されていない参照です
x11_window.c:(.text+0x2366): `Xutf8LookupString' に対する定義されていない参照です
x11_window.c:(.text+0x23d0): `Xutf8LookupString' に対する定義されていない参照です
x11_window.c:(.text+0x24ad): `XLookupString' に対する定義されていない参照です
x11_window.c:(.text+0x257c): `XEventsQueued' に対する定義されていない参照です
x11_window.c:(.text+0x25a0): `XPeekEvent' に対する定義されていない参照です
x11_window.c:(.text+0x2ced): `XSendEvent' に対する定義されていない参照です
x11_window.c:(.text+0x2da5): `XConvertSelection' に対する定義されていない参照です
x11_window.c:(.text+0x2f32): `XSendEvent' に対する定義されていない参照です
x11_window.c:(.text+0x2f48): `XFlush' に対する定義されていない参照です
x11_window.c:(.text+0x3046): `XFree' に対する定義されていない参照です
x11_window.c:(.text+0x310e): `XSendEvent' に対する定義されていない参照です
x11_window.c:(.text+0x3124): `XFlush' に対する定義されていない参照です
x11_window.c:(.text+0x319d): `XSetICFocus' に対する定義されていない参照です
x11_window.c:(.text+0x322a): `XUnsetICFocus' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwGetWindowPropertyX11' 内:
x11_window.c:(.text+0x3420): `XGetWindowProperty' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformCreateWindow' 内:
x11_window.c:(.text+0x3652): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformDestroyWindow' 内:
x11_window.c:(.text+0x36db): `XDestroyIC' に対する定義されていない参照です
x11_window.c:(.text+0x3749): `XGetSelectionOwner' に対する定義されていない参照です
x11_window.c:(.text+0x3799): `XDeleteContext' に対する定義されていない参照です
x11_window.c:(.text+0x37bd): `XUnmapWindow' に対する定義されていない参照です
x11_window.c:(.text+0x37e1): `XDestroyWindow' に対する定義されていない参照です
x11_window.c:(.text+0x3824): `XFreeColormap' に対する定義されていない参照です
x11_window.c:(.text+0x3849): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformSetWindowTitle' 内:
x11_window.c:(.text+0x389b): `Xutf8SetWMProperties' に対する定義されていない参照です
x11_window.c:(.text+0x38fa): `XChangeProperty' に対する定義されていない参照です
x11_window.c:(.text+0x3959): `XChangeProperty' に対する定義されていない参照です
x11_window.c:(.text+0x3973): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformSetWindowIcon' 内:
x11_window.c:(.text+0x3bd3): `XChangeProperty' に対する定義されていない参照です
x11_window.c:(.text+0x3c17): `XDeleteProperty' に対する定義されていない参照です
x11_window.c:(.text+0x3c2d): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformGetWindowPos' 内:
x11_window.c:(.text+0x3c9e): `XTranslateCoordinates' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformSetWindowPos' 内:
x11_window.c:(.text+0x3d13): `XAllocSizeHints' に対する定義されていない参照です
x11_window.c:(.text+0x3d40): `XGetWMNormalHints' に対する定義されていない参照です
x11_window.c:(.text+0x3d9a): `XSetWMNormalHints' に対する定義されていない参照です
x11_window.c:(.text+0x3da6): `XFree' に対する定義されていない参照です
x11_window.c:(.text+0x3dcd): `XMoveWindow' に対する定義されていない参照です
x11_window.c:(.text+0x3de3): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformGetWindowSize' 内:
x11_window.c:(.text+0x3e57): `XGetWindowAttributes' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformSetWindowSize' 内:
x11_window.c:(.text+0x3f25): `XResizeWindow' に対する定義されていない参照です
x11_window.c:(.text+0x3f3b): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformSetWindowSizeLimits' 内:
x11_window.c:(.text+0x3fa7): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformSetWindowAspectRatio' 内:
x11_window.c:(.text+0x4020): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformGetWindowFrameSize' 内:
x11_window.c:(.text+0x41c3): `XCheckIfEvent' に対する定義されていない参照です
x11_window.c:(.text+0x42a7): `XFree' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformIconifyWindow' 内:
x11_window.c:(.text+0x4326): `XIconifyWindow' に対する定義されていない参照です
x11_window.c:(.text+0x433c): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformRestoreWindow' 内:
x11_window.c:(.text+0x43a7): `XMapWindow' に対する定義されていない参照です
x11_window.c:(.text+0x4472): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformMaximizeWindow' 内:
x11_window.c:(.text+0x452e): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformShowWindow' 内:
x11_window.c:(.text+0x4571): `XMapWindow' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformHideWindow' 内:
x11_window.c:(.text+0x45b2): `XUnmapWindow' に対する定義されていない参照です
x11_window.c:(.text+0x45c8): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformFocusWindow' 内:
x11_window.c:(.text+0x464a): `XRaiseWindow' に対する定義されていない参照です
x11_window.c:(.text+0x4675): `XSetInputFocus' に対する定義されていない参照です
x11_window.c:(.text+0x468b): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformSetWindowMonitor' 内:
x11_window.c:(.text+0x4718): `XMoveResizeWindow' に対する定義されていない参照です
x11_window.c:(.text+0x479a): `XMapRaised' に対する定義されていない参照です
x11_window.c:(.text+0x47ec): `XMoveResizeWindow' に対する定義されていない参照です
x11_window.c:(.text+0x4802): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformWindowFocused' 内:
x11_window.c:(.text+0x4843): `XGetInputFocus' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformWindowVisible' 内:
x11_window.c:(.text+0x48e3): `XGetWindowAttributes' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformWindowMaximized' 内:
x11_window.c:(.text+0x49d0): `XFree' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformPollEvents' 内:
x11_window.c:(.text+0x4a1e): `XPending' に対する定義されていない参照です
x11_window.c:(.text+0x4a46): `XNextEvent' に対する定義されていない参照です
x11_window.c:(.text+0x4aa7): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformWaitEvents' 内:
x11_window.c:(.text+0x4ae4): `XPending' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformWaitEventsTimeout' 内:
x11_window.c:(.text+0x4b25): `XPending' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformPostEmptyEvent' 内:
x11_window.c:(.text+0x4bf2): `XSendEvent' に対する定義されていない参照です
x11_window.c:(.text+0x4c08): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformGetCursorPos' 内:
x11_window.c:(.text+0x4c86): `XQueryPointer' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformSetCursorPos' 内:
x11_window.c:(.text+0x4d62): `XWarpPointer' に対する定義されていない参照です
x11_window.c:(.text+0x4d7c): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformSetCursorMode' 内:
x11_window.c:(.text+0x4e39): `XGrabPointer' に対する定義されていない参照です
x11_window.c:(.text+0x4e80): `XUngrabPointer' に対する定義されていない参照です
x11_window.c:(.text+0x4ed8): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformGetKeyName' 内:
x11_window.c:(.text+0x4f89): `XkbKeycodeToKeysym' に対する定義されていない参照です
x11_window.c:(.text+0x4fd7): `XkbTranslateKeySym' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformCreateStandardCursor' 内:
x11_window.c:(.text+0x509a): `XCreateFontCursor' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformDestroyCursor' 内:
x11_window.c:(.text+0x5110): `XFreeCursor' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformSetCursor' 内:
x11_window.c:(.text+0x5153): `XFlush' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformSetClipboardString' 内:
x11_window.c:(.text+0x51cd): `XSetSelectionOwner' に対する定義されていない参照です
x11_window.c:(.text+0x51f4): `XGetSelectionOwner' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformGetClipboardString' 内:
x11_window.c:(.text+0x52a8): `XGetSelectionOwner' に対する定義されていない参照です
x11_window.c:(.text+0x5358): `XConvertSelection' に対する定義されていない参照です
x11_window.c:(.text+0x5386): `XCheckTypedEvent' に対する定義されていない参照です
x11_window.c:(.text+0x53f2): `XFree' に対する定義されていない参照です
x11_window.c:(.text+0x5419): `XDeleteProperty' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(x11_window.c.o): 関数 `_glfwPlatformGetPhysicalDevicePresentationSupport' 内:
x11_window.c:(.text+0x55cd): `XVisualIDFromVisual' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(posix_tls.c.o): 関数 `_glfwInitThreadLocalStoragePOSIX' 内:
posix_tls.c:(.text+0x18): `pthread_key_create' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(posix_tls.c.o): 関数 `_glfwTerminateThreadLocalStoragePOSIX' 内:
posix_tls.c:(.text+0x7a): `pthread_key_delete' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(posix_tls.c.o): 関数 `_glfwPlatformSetCurrentContext' 内:
posix_tls.c:(.text+0xa4): `pthread_setspecific' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(posix_tls.c.o): 関数 `_glfwPlatformGetCurrentContext' 内:
posix_tls.c:(.text+0xbf): `pthread_getspecific' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(glx_context.c.o): 関数 `chooseGLXFBConfig' 内:
glx_context.c:(.text+0x3f4): `XFree' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(glx_context.c.o): 関数 `getProcAddressGLX' 内:
glx_context.c:(.text+0x6fe): `dlsym' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(glx_context.c.o): 関数 `_glfwInitGLX' 内:
glx_context.c:(.text+0x81d): `dlopen' に対する定義されていない参照です
glx_context.c:(.text+0x8a7): `dlsym' に対する定義されていない参照です
glx_context.c:(.text+0x8d5): `dlsym' に対する定義されていない参照です
glx_context.c:(.text+0x903): `dlsym' に対する定義されていない参照です
glx_context.c:(.text+0x931): `dlsym' に対する定義されていない参照です
glx_context.c:(.text+0x95f): `dlsym' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(glx_context.c.o):glx_context.c:(.text+0x98d): `dlsym' に対する定義されていない参照がさらに続いています
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(glx_context.c.o): 関数 `_glfwTerminateGLX' 内:
glx_context.c:(.text+0x1012): `dlclose' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(glx_context.c.o): 関数 `_glfwChooseVisualGLX' 内:
glx_context.c:(.text+0x1a12): `XFree' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(egl_context.c.o): 関数 `getProcAddressEGL' 内:
egl_context.c:(.text+0x6a1): `dlsym' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(egl_context.c.o): 関数 `destroyContextEGL' 内:
egl_context.c:(.text+0x70b): `dlclose' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(egl_context.c.o): 関数 `_glfwInitEGL' 内:
egl_context.c:(.text+0x820): `dlopen' に対する定義されていない参照です
egl_context.c:(.text+0x8dd): `dlsym' に対する定義されていない参照です
egl_context.c:(.text+0x90b): `dlsym' に対する定義されていない参照です
egl_context.c:(.text+0x939): `dlsym' に対する定義されていない参照です
egl_context.c:(.text+0x967): `dlsym' に対する定義されていない参照です
egl_context.c:(.text+0x995): `dlsym' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(egl_context.c.o):egl_context.c:(.text+0x9c3): `dlsym' に対する定義されていない参照がさらに続いています
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(egl_context.c.o): 関数 `_glfwTerminateEGL' 内:
egl_context.c:(.text+0xef9): `dlclose' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(egl_context.c.o): 関数 `_glfwCreateContextEGL' 内:
egl_context.c:(.text+0x18d7): `dlopen' に対する定義されていない参照です
/home/pollenjp/.glfw/install/GLFW-3.2.1/lib/libglfw3.a(egl_context.c.o): 関数 `_glfwChooseVisualEGL' 内:
egl_context.c:(.text+0x1aec): `XGetVisualInfo' に対する定義されていない参照です
egl_context.c:(.text+0x1b41): `XFree' に対する定義されていない参照です
collect2: error: ld returned 1 exit status
Makefile:21: ターゲット 'check_version' のレシピで失敗しました
make: *** [check_version] エラー
```

