# Yii2-mssql

### Description

This image is hosted on [DockerHub](https://hub.docker.com/r/tamuarchi/yii2-mssql/). It contains a Yii2 Framework
environment with Microsoft's SQL drivers.

**BASE IMAGE:** [yiisoftware/yii2-php:7.3-apache](https://github.com/yiisoft/yii2-docker)  
**LATEST VERSION:** 2.0.0

### To Use

Pull image from Docker Hub  
`docker pull tamuarchi/yii2-mssql`

Alternatively, use image in a docker-compose file.  
`FROM tamuarchi/yii2-mssql:latest`

### Building

Clone `git clone git@github.com:architexas/yii2-mssql.git`  
Run `docker build .`

### Versions

| Tag                                                                  | Description                                                      |
| -------------------------------------------------------------------- | ---------------------------------------------------------------- |
| Latest                                                               | Tag 1.1.2                                                        |
| [1.1.2](https://github.com/architexas/yii2-mssql/releases/tag/1.1.2) | Removed idekey configuration to allow all IDEs to connect.       |
| [1.1.1](https://github.com/architexas/yii2-mssql/releases/tag/1.1.1) | Changed XDebug port to 9000 and added a few more configurations. |
| [1.1.0](https://github.com/architexas/yii2-mssql/releases/tag/1.1.0) | Added Xdebug, more default settings, and more documentation      |
| [1.0.1](https://github.com/architexas/yii2-mssql/releases/tag/1.0.1) | Added documentation on the image's structure                     |
| [1.0.0](https://github.com/architexas/yii2-mssql/releases/tag/1.0.0) | First image: PHP with MSSQL drivers and some additional tools    |

### Included

- [PHP 7.3.12](https://www.php.net/ChangeLog-7.php#7.3.12)
- Apache/[2.4.38](http://www.apache.org/dist/httpd/CHANGES_2.4.38) (Debian) - [Vulnerabilities List](https://httpd.apache.org/security/vulnerabilities_24.html)
- [Microsoft ODBC Driver 17 for SQL Server](https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver15)
- [Linux Debian 10.2](https://www.debian.org/News/2019/20191116)

### Tools Installed

1. [apt-transport-https](http://manpages.ubuntu.com/manpages/bionic/man1/apt-transport-https.1.html)
2. [gettext](http://manpages.ubuntu.com/manpages/xenial/en/man1/gettext.1.html)
3. [git](http://manpages.ubuntu.com/manpages/xenial/en/man1/git.1.html)
4. [tree](http://manpages.ubuntu.com/manpages/xenial/en/man1/tree.1.html)
5. [unzip](http://manpages.ubuntu.com/manpages/xenial/en/man1/unzip.1.html)
6. [vim](http://manpages.ubuntu.com/manpages/xenial/en/man1/vim.1.html)
7. [wget](http://manpages.ubuntu.com/manpages/xenial/en/man1/wget.1.html)
8. [Xdebug 2.9.2](https://xdebug.org/docs/install)
    > NOTE: Xdebug has been enabled by default and configured to call ip `host.docker.internal` on `9005` port in order
    to avoid conflicts with other applications and to bypass [a network limitation on Mac OS](https://docs.docker.com/docker-for-mac/networking/#port-mapping).     

### Structure

```
./
|-- app
| `-- APPLICATION CAN GO HERE (Recommended for Basic Template Applications)
|-- bin
|-- boot
|-- dev
|-- etc
|-- home
|-- lib
|-- lib64
|-- media
|-- mnt
|-- opt
| |-- microsoft
| `-- mssql-tools
|-- proc
|-- root
|-- run
| |-- apache2
| `-- lock
|-- sbin
|-- srv
|-- sys
|-- tmp
| `-- pear
|-- usr
    |-- local
        |-- etc
            |-- php.ini (PHP Settings)
            |-- conf.d
                |-- xdebug.ini (Xdebug Settings)
                |-- base.ini (PHP Settings)
`-- var
    |-- backups
    |-- cache
    |-- lib
    |-- local
    |-- lock
    |-- log
    |-- mail
    |-- opt
    |-- run
    |-- spool
    |-- tmp
    `-- www
         `-- APPLICATION CAN GO HERE (Recommended for Advance Template Applications)
```

### Collaborators

Cory Thompson ([@cthompson527](https://github.com/cthompson527))  
Raul Jimenez  
Jose Manriquez ([@josejlm2](https://github.com/josejlm2))
