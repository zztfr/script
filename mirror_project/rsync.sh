#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH


#if [ $(id -u) != "0" ]; then
#    echo "Error: You must be root to run this script, please use root to run this script!"
#    exit 1
#fi
## =======Rsync script =======

# debug
#set -x
# incloude
. include/env.sh
. include/list.sh
. include/main.sh
. include/stack.sh



case "$1" in
    all)
        
        all 2>&1 | tee /root/all-download.log
    ;;
    list)
        List
    ;;
    mariadb)
        Rysnc_Mariadb_For_CentOS7
    ;;
    nginx)
        Curl_Nginx_For_Centos6
    ;;
    zabbix6)
        Rsync_Zabbix_For_Centos6
    ;;
    zabbix7)
        Rsync_Zabbix_For_Centos7
    ;;
    mongodb)
        Rsync_Mongodb_For_Centos6
    ;;
    centos6)
        Rsync_Centos6
    ;;
    centos7)
        Rsync_Centos7
    ;;
    epel6)
        Rsync_epel6
    ;;
    epel7)
        Rsync_epel7
    ;;
    remi)
        Rsync_Remi_For_Centos6
    ;;
    check)
        Check_Software
        Check_Work_Dir
        Check_Data_Dir
        Check_Mirros_Dir
    ;;
    *)  
        RUN
        redcolor "Usage: $0 {check|all|list}"
        ;;
esac

exit
