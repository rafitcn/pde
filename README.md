# pde
Personal development environment

---
### docker部署宝塔面板
主要是为了方便本地快速搭建开发环境

初始端口：  `8888`  
初始用户名：`username`  
初始密码：  `password`  
初始安全地址: `/auth`  
默认容器目录：`/www/wwwroot` 可以将本地项目映射到此目录

默认去掉了面板ssl  
默认去掉了强制绑定宝塔账号限制  
增加了网页终端的ssh连接，默认端口`22`，允许在创建容器时指定ssh端口(增加环境变量`RAFIT_SSH_PORT`,eg. `docker run -itd -e RAFIT_SSH_PORT=52600 ...`)


### 通过host模式运行(Linux可用)
`docker run -tid --name baota --net=host --privileged=true --restart always -v ~/wwwroot:/www/wwwroot rafitcn/baota`

这种方式不需要手动绑定端口，docker内的端口会全部映射到主机上


### 通过bridge模式运行
`docker run -tid --name baota -p 80:80 -p 443:443 -p 8888:8888 -p 888:888 --privileged=true --restart always -v ~/wwwroot:/www/wwwroot rafitcn/baota`
