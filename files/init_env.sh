#!/bin/bash

# 配置源和安装必需的软件包
if ! grep -q '^http://mirrors.ustc.edu.cn/ubuntu/' /etc/apt/sources.list; then
  sed -i 's#http://archive.ubuntu.com/ubuntu/#http://mirrors.ustc.edu.cn/ubuntu/#' /etc/apt/sources.list
  sed -i 's#http://security.ubuntu.com/ubuntu/#http://mirrors.ustc.edu.cn/ubuntu/#' /etc/apt/sources.list
  # 不fq很慢
  sed -i '/dl.winehq.org/s/^/#/' /etc/apt/sources.list
fi

# 设置中文环境
if ! dpkg -s fonts-wqy-microhei &>/dev/null; then
  # msyh.ttc 解决微信部分小字不显示问题
  dpkg -i /root/files/deb/fonts-wqy-microhei_0.2.0-beta-3_all.deb && \
  cp /root/files/fonts/msyh.ttc /usr/share/fonts/ && fc-cache -fv && \
  echo 'LANG=zh_CN.UTF-8' > /etc/default/locale && \
  echo -e 'en_US.UTF-8 UTF-8\nzh_CN.GBK GBK\nzh_CN.UTF-8 UTF-8\nzh_SG GB2312' > /etc/locale.gen && \
  locale-gen && \
  update-locale LANG=zh_CN.UTF-8
fi

# 安装 winetricks
cp -f /root/files/bin/winetricks /usr/local/bin/ && chmod +x /usr/local/bin/winetricks
