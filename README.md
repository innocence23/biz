## ✨ 特性

- 遵循 RESTful API 设计规范
- 基于 GIN 框架
- 基于Casbin的 RBAC 访问控制模型
- JWT 认证
- 支持 Swagger 文档(基于swaggo)
- 基于 GORM 的数据库存储
-


1. docker cp 容器名：要拷贝的文件在容器里面的路径       要拷贝到宿主机的相应路径
1. docker exec -it master /bin/bash -c 'echo $PATH'
1. todo 进入容器生成 golang命令   [ docker-compose exec server /bin/sh  ->  go build -o ./run . ]
1. todo 进入容器生成 dist前端页面  [ docker-compose exec client /bin/bash  ->   npm run build:prod ]
1. image文件部署共享问题
1. 添加一个用户验证权限
1. 隐藏管理菜单

首页问题

创建人
