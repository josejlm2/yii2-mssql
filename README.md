# yii2-mssql
Base image hosted on [DockerHub](https://hub.docker.com/r/tamuarchi/yii2-mssql/) for Yii2 Framework environment with MSSQL database 

### Description
BASE IMAGE: [yiisoftware/yii2-php:7.1-apache](https://github.com/yiisoft/yii2-docker)

### Building 
Run `docker build <path to folder of Dockerfile location>`

### Versions
- [PHP 7.1.12](http://php.net/index.php#id2018-10-11-3)  
- Apache 2.4  
- Microsoft SQL Server 2017 (RTM-CU9-GDR) (KB4293805) - 14.0.3035.2 (X64) Developer Edition (64-bit)
- Linux (Ubuntu 16.04.5 LTS)



### Tools Installed
1. [apt-transport-https](http://manpages.ubuntu.com/manpages/bionic/man1/apt-transport-https.1.html)
2. [gettext](http://manpages.ubuntu.com/manpages/xenial/en/man1/gettext.1.html)
3. [git](http://manpages.ubuntu.com/manpages/xenial/en/man1/git.1.html)
4. [tree](http://manpages.ubuntu.com/manpages/xenial/en/man1/tree.1.html)
5. [unzip](http://manpages.ubuntu.com/manpages/xenial/en/man1/unzip.1.html)
6. [vim](http://manpages.ubuntu.com/manpages/xenial/en/man1/vim.1.html) 
7. [wget](http://manpages.ubuntu.com/manpages/xenial/en/man1/wget.1.html)
8. [Xdebug 2.6.1](https://confluence.jetbrains.com/display/PhpStorm/Xdebug+Installation+Guide)
> NOTE: Xdebug has been enabled by default and configured to call ip `xdebug.remote_host` on `9005` port 
(not use standard port to avoid conflicts), so you have to configure your IDE to receive connections from that ip. 
If you are using macOS, you can fill `xdebug.remote_host` with `host.docker.internal`, due to [a network limitation on mac](https://docs.docker.com/docker-for-mac/networking/#port-mapping).

### Structure 
```   
./
|-- app
| `-- APPLICATION CAN GO HERE
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
         `-- APPLICATION CAN GO HERE
```

### Collaborators
Cory Thompson ([@cthompson527](https://github.com/cthompson527))  
Raul Jimenez  
Jose Manriquez ([@josejlm2](https://github.com/josejlm2))  
