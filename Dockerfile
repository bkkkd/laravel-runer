FROM centos:7
LABEL maintainer "Tim.Huang <tim@atim.cn>"
RUN yum install -y net-tools vim epel-release && \
    curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/mssql-release.repo && \
    yum install -y supervisor && \
    yum-config-manager --enable remi-php72 && \
	yum install -y  php-opcache php-pecl-apcu php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pdo php-pear php-fpm php-cli php-xml php-bcmath php-process php-gd php-common php-pecl-zip php-pecl-swoole4 php mariadb mariadb-server && \
    php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer 

RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    ACCEPT_EULA=Y && \
    yum  install -y msodbcsql17 mssql-tools  && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc && \
    yum install -y unixODBC-devel && \
    yum install -y php-sqlsrv

VOLUME ["/myapp","/var/lib/mysql"]
WORKDIR /myapp
EXPOSE 8000 9001
CMD ["/bin/sh","./run.sh"]
