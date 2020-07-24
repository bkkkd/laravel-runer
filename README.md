# laravel-runer
用于运行laravel程序,目前定制该镜像的目的出于在旧服务器环境中运行新的laravel程序.(原来环境不能修改php版本)

## 最简实现

1. 复制example 下的文件和目录到 laravel的根目到下
	* build-box.sh 创建以及运行容器
	* run.sh 容器中执行的命令，注意最后会运行 supervisord 作为所有服务的守护进程 
	* docker/supervisor/supervisord.conf supervisor的配置文件
2. 根据项目要求修改容器的命称以及启用的端口 (build-box.sh)
3. 目前的run.sh是基于laravel运行前需要执行的命令，也可以根据实际项目的需求，修改为 thinkphp的运行容器
4. 配置运行的守护进程，如 web服务，队列等



