# docker-wine-chinese
基于 `scottyhardy/docker-wine:stable-9.0-20240310` 镜像，添加中文支持，开箱即用，解决中文乱码问题。

# 运行

```bash
docker run -it \
--rm \
--name docker-wine-chinese \
--hostname="$(hostname)" \
--env="RDP_SERVER=yes" \
--publish="3389:3389/tcp" \
-v /mnt:/mnt \
xiaoweiba1028/docker-wine-chinese:1.0.0 /bin/bash
```

使用RDP客户端连接即可，用户名/密码：`wineuser/wineuser`

详细的文档可移步至：[https://github.com/scottyhardy/docker-wine](https://github.com/scottyhardy/docker-wine)

# 构建
```bash
git git@github.com:xweiba/docker-wine-chinese.git && cd docker-wine-chinese

# 该文件超过50MB, 无法推送到github，自己下
mkdir -p files/winetricks/sourcehansans && mkdir -p files/winetricks/win2ksp4
wget -O ./files/winetricks/sourcehansans/SourceHanSans.ttc.zip https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSans.ttc.zip
wget -O ./files/winetricks/win2ksp4/W2KSP4_EN.EXE http://x3270.bgp.nu/download/specials/W2KSP4_EN.EXE

# 输入框异常修复， 文件1.4GB 左右，太大了，有需要的自己装，sudo -u wineuser WINEARCH=win64 WINEPREFIX=/home/wineuser/.wine winetricks msftedit
# wget -O ./files/winetricks/win7sp1/windows6.1-KB976932-X64.exe http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe
# wget -O ./files/winetricks/win7sp1/windows6.1-KB976932-X86.exe http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe

docker build --no-cache -t docker-wine-chinese:1.0.0 .
```

# 测试
```bash
docker run -it \
--rm \
--name docker-wine-chinese \
--hostname="$(hostname)" \
--env="RDP_SERVER=yes" \
--publish="3389:3389/tcp" \
-v /mnt:/mnt \
docker-wine-chinese:1.0.0 /bin/bash
```

# 推送至仓库
```bash
docker login
docker tag docker-wine-chinese:1.0.0 xiaoweiba1028/docker-wine-chinese:1.0.0
docker push xiaoweiba1028/docker-wine-chinese:1.0.0
```

# 问题Fix

```bash
# 微信图片有问题可以试试
sudo apt-get install libjpeg62:i386

# 输入框异常修复，不输入可以不安装，共1.4GB 左右，未进镜像，需要的自己进bash装
sudo -u wineuser WINEARCH=win64 WINEPREFIX=/home/wineuser/.wine winetricks msftedit

```

## 特别感谢
感谢下列项目,记得给大佬们点🌟  
[https://github.com/scottyhardy/docker-wine](https://github.com/scottyhardy/docker-wine)
