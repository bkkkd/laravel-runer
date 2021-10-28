FROM centos:7
LABEL maintainer "Tim.Huang <tim@atim.cn>"
RUN yum install -y net-tools vim epel-release && \
    yum install -y supervisor nginx zip unzip crontabs ca-certificates && \
    rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    yum-config-manager --enable remi-php74  && \
	yum install -y  php-opcache php-pecl-apcu php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pdo php-pear php-fpm php-cli php-xml php-bcmath php-process php-gd php-common php-pecl-zip php-pecl-swoole4 php mariadb mariadb-server openssl-devel && \
    php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"  && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer && \
    curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/mssql-release.repo && \
    ACCEPT_EULA=Y yum  install -y msodbcsql17 mssql-tools  && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc && \
    source ~/.bashrc && \
    yum install -y unixODBC-devel && \
    yum install -y php-sqlsrv && \
    yum install -y ImageMagick-devel bzip2 && \
    curl -o zbar-0.10.tar.bz2 http://jaist.dl.sourceforge.net/project/zbar/zbar/0.10/zbar-0.10.tar.bz2 && \
    tar jxvf zbar-0.10.tar.bz2 && \
    cd zbar-0.10 && \
    ./configure --without-gtk --without-python --without-qt --disable-video --prefix=/usr/local/zbar && \
    make && make install &&\
    yum clean all &&\
    rm -rf /tmp/* && \
    rm -rf /var/cache/*
VOLUME ["/myapp","/app"]
WORKDIR /myapp
EXPOSE 8000 9001
CMD ["/bin/sh","./run.sh"]
