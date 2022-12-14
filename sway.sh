#!/bin/sh
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_CURRENT_SESSION=sway
export LIBSEAT_BACKEND=logind
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export GDK_DPI_SCALE=1.5
export QT_SCALE_FACTOR=1.5
export MOZ_ENABLE_WAYLAND=1
export WINIT_UNIX_BACKEND=x11
export _JAVA_AWT_WM_NONREPARENTING=1

# Input method
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT5_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

eval $(gnome-keyring-daemon --start --components=pkcs11,secrets)

exec sway
