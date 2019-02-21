#!/bin/bash

# $# script
# $1 1й аргумент удаленный пользователь
# $2 2й аргумент IP адрес
# $3 3й аргумент путь к локальному файлу
# $4 4й аргумент удаленный путь

user_name=$1
IP_addr=$2
local_path=$3
remote_path=$4

if [ $# != 4 ]; then
    echo "Error! Enter correct arguments"
    exit
fi

cat <<EOT > ~/zombie.txt
$USER
$user_name
$(hostname -i)
$local_path
$remote_path
$(date)
EOT

scp $local_path ~/zombie.txt $user_name@$IP_addr:$remote_path

rm ~/zombie.txt
