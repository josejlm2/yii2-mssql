# Name: Yii2-mssql
# Version: 1.1.0
# Description: A php (yii2) image with mssql drivers and tools installed
#
#-------------------------------------------------------------------
# I. BASE IMAGE
#-------------------------------------------------------------------

    # Using Yii2's official docker image as base                                                                        Step 1
    # Using tag version 7.1-apache-17.12.0 because version 7.1-apache uses Alpine, not Debian, which breaks MSSQL Drivers
FROM yiisoftware/yii2-php:7.1-apache-17.12.0

#-------------------------------------------------------------------
# II. INSTALL TOOLS
#-------------------------------------------------------------------

    # Get updates and install helping tools needed for setup                                                            Step 2
RUN apt-get update && apt-get install --no-install-recommends -y \
        apt-transport-https \
        gettext \
        git \
        unzip \
        vim \
        tree \
        wget

    # Install xdebug 2.6.1                                                                                              Step 3
RUN cd /tmp && \
    git clone git://github.com/xdebug/xdebug.git && \
    cd xdebug && \
    git checkout 97cc937cfeec707663bd6b1aa8d38d7cc98dd5cc && \
    phpize && \
    ./configure --enable-xdebug && \
    make && \
    make install && \
    rm -rf /tmp/xdebug

    # Set Yii2 image's environment variable                                                                             Step 4
ENV PHP_ENABLE_XDEBUG 1

#-------------------------------------------------------------------
# III. SET UP DATABASE DRIVERS
#-------------------------------------------------------------------

    # install ODBC:                                                                                                     Step 5
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/8/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get install -y locales \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen \
    && apt-get update

    # accept EULA terms and install mssql tools                                                                         Step 6
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql unixodbc-dev mssql-tools

    # install PHP PDO SQLSRV driver:                                                                                    Step 7
RUN pecl install sqlsrv \
    && pecl install pdo_sqlsrv \
    && docker-php-ext-enable sqlsrv pdo_sqlsrv


#-------------------------------------------------------------------
# III. SETUP SERVER SETTINGS FOR DEVELOPMENT
#-------------------------------------------------------------------

    # enable Apache rewrite module                                                                                      Step 8
RUN a2enmod rewrite

    # copy new configuration settings                                                                                   Step 9 & 10
COPY image-files/php.ini /usr/local/etc/php/
COPY image-files/xdebug.ini /usr/local/etc/php/conf.d/

    # Update the PHP.ini file, enable <? ?> tags                                                                        Step 11
RUN sed -i "s/short_open_tag=0/short_open_tag=1/" 	/usr/local/etc/php/conf.d/base.ini

###<!-- BASE PHP END -->###