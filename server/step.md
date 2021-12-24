##### 流程和源码

1. 入口文件
2. 执行命令；使用包 `cobra.Command`
   1. ```
      cobra init demo --pkg-name=demo
      #生成目录结构
      demo
      ├── cmd
      │   └── root.go
      ├── LICENSE
      └── main.go
      ```
3. ```
   ➜  server git:(master) ✗ ./main  -h   
   admin

   Usage:
     admin [flags]
     admin [command]

   Available Commands:
     config      Get Application config info
     createapp   Create a new app
     help        Help about any command
     server      Start API server
     version     Get version info

   version 版本
   help 命令帮助
   config 查看配置信息
   createapp 生成文件不目录创建app
   server 启动服务，常用，重要，重要，重要
   ```
4. server 讲解
   1. ```
      go-admin server -c=config/settings.dev.yml -a=false  两个参数
      ```
   2. init -> 接受传入的参数；分辨init初始化所有模块的路由
   3. 进入逻辑：1，初始化配置参数； 2，启动监听队列（操作日志，登陆日志，-a 权限api数据入库）
   4. 注入各个中间件，设置启动http服务参数；
   5. go协程启动定时任务；
   6. 如果 a == true ； 组织准备生成api逻辑（读取路由数据和swagger里面的summary信息）
   7. 最终启动http/s服务，监听超时和优雅重启服务
5. 中间件拦截（逻辑 日志，限流，jwt，权限，等等）
6. http接口请求 （router -> api -> baseapi( param log db context service etc) -> (dto)service(model)  ）

##### Job

1. http方式
2. 文件方式，此方式需要在job文件夹中建立对应的文件，可以参考example文件，需要加入到 `jobList = map[string]JobsExec` 中
3. 最终实现其实是引入的此类库：https://github.com/robfig/cron

##### 其他：

1. 自动代码生成时，如果关联查询，不会连表，会默认取出来10000条关联表的数据，前段拼凑
2. 自动代码生成时，如果使用字典，也会调用多次字典表字段
3. 自动代码生成时，默认走的business=id69目录下 (硬编码)

醉了？？？ 感觉panic后不会重启？？？
