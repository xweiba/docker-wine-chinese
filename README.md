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

# 构建
```bash
git git@github.com:xweiba/docker-wine-chinese.git && cd docker-wine-chinese
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
## 特别感谢
感谢下列项目,记得给大佬们点🌟  
https://github.com/scottyhardy/docker-wine
