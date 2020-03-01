# docker-seafile-onlyoffice

使用 `docker-compose` 来部署带有 OnlyOffice 支持的 seafile-pro（当前版本为 6.3.13）。

目录 `ci` 包含 travis CI 脚本。
目录 `deploy` 包含使用 `docker-compose` 来部署镜像的文件，其中包含 `docker-compose.yml` 配置文件和运行镜像时更改默认镜像的配置文件。
目录 `image` 包含制作本仓库所有使用到的镜像的构建脚本。

## 构建镜像

进入 `image` 目录，然后查看 `Makefile` 来构建镜像。可能你需要将其中的 `fsslc` 改为另外的名字。

## 部署

如果不想构建镜像，可以直接进入 `deploy` 目录，然后执行 `docker-compose` 来部署，如果出现端口冲突等问题，请自行解决。

另外，为了方便，我将 `deploy/docker-compose.yml` 中的 IP 地址进行了固定，如果你想更改 IP 地址和端口，请更改 `deploy/docker-compose.yml` 文件的第 18,21,32,46 行，以及 `deploy/conf/seafile.nginx.conf.template` 的 112 行。
