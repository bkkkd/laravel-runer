FROM centos:7
LABEL maintainer "Tim.Huang <tim@atim.cn>"
RUN yum install -y net-tools vim epel-release && \
	rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    yum-config-manager --enable remi-php72 && \
	yum install -y  php-opcache php-pecl-apcu php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pdo php-pear php-fpm php-cli php-xml php-bcmath php-process php-gd php-common php-pecl-zip php mariadb mariadb-server && \
    php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

VOLUME ["/myapp","/var/lib/mysql"]
WORKDIR /myapp
EXPOSE 8000
CMD ["/bin/sh","./run.sh"]
