#!/bin/sh

# 更新操作系统字体
# chmod -R 777 /usr/share/fonts/Fonts
# cd /usr/share/fonts/Fonts/
#sudo mkfontscale
#sudo mkfontdir
fc-cache -fv

# 更新libreoffice字体
coolconfig update-system-template

