#!/bin/bash

username="$1"
if [ -z "$username" ]; then
  echo "未传入用户名，不执行 wine 初始化"
  exit 0
fi

wine_prefix="/home/$username/.wine"
winetricks_cache="/home/$username/.cache/winetricks"

if [ ! -d "$wine_prefix" ]; then
  echo "初始化 wine 环境..."

  # 创建缓存目录并复制文件，-p 参数使之即使目录存在也不会报错
  mkdir -p "${winetricks_cache}"
  cp -r /root/files/winetricks/* "${winetricks_cache}"
  chown -R "$username:$username" "${winetricks_cache}"

  echo "初始化和安装 wine64 环境及依赖..."
  env_strings="WINEARCH=win64 WINEPREFIX=$wine_prefix LC_ALL=zh_CN.UTF8"

  # 'winetricks msftedit' 解决输入框问题，文件较大，不复制进镜像了，需要的手动装
  # sudo -u wineuser WINEARCH=win64 WINEPREFIX=/home/wineuser/.wine LC_ALL="zh_CN.UTF8" winetricks msftedit
  for command in winecfg 'winetricks cjkfonts' 'winetricks vcrun2022' 'winetricks riched20' 'winetricks riched30' 'winetricks richtx32' 'winetricks msftedit'; do
    su $username -c "$env_strings $command"
  done
fi
