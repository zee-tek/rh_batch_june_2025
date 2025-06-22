#!/bin/bash

if [ `id -u` != 0 ];then
        echo ""
        echo -e "\e[31m Failed: Please Run this Script as root\e[0m\n"
        exit 1
fi
user_name="user1"
validate_autofs() {
        echo -e "\n     Evaluate Autofs       "
        echo -e "===========================\n"

        rm -rf /remo/$user_name/uniq1 &>/dev/null
        su - $user_name -c "touch /remo/$user_name/uniq1" &>/dev/null
        file_st=$?
        df -h|grep $user_name &>/dev/null
        mn_st=$?

        if [ $file_st -eq 0 ]&&[ $mn_st -eq 0 ];then
                echo -e "\e[32mAutoFS_Check: Pass\e[0m\n"
        else
                echo -e "\e[31mAutoFS_Check: Fail\e[0m\n"
        fi
}

