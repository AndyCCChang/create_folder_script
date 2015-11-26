#!/bin/bash
VERSION=1.0

print_version()
{
        echo "VERSION: "$VERSION
}

if [ "`echo $@ | grep -cw -- -v`" == "1"  ]; then
        print_version
        exit 0
fi


if [ "$1" == "" ]||[ "$2" == "" ] ; then
        echo "Please use ./create_nas_folder.sh -v to check version"
        echo "Please use ./create_nas_folder.sh {ip} {virtual_storage}"
        echo "e.g., ./create_nas_folder.sh 1.1.1.1 myVS"
        exit 0
fi


ip=$1
gateway_group=$2
echo ip = $ip
echo virtual storage = $gateway_group
echo login...
curl --cookie-jar ezstor.cookie --insecure "https://$ip:8080/cgi-bin/ezs3/login?user_id=admin&password=admin"

echo create nas folder

for ((i=1; i<=5; i=i+1))
do
curl --cookie ezstor.cookie --insecure "https://$ip:8080/cgi-bin/ezs3/create_shared_folder?name=f$i&nfs=true&smb=true&read_only=false&mode=async&guest_ok=true&gateway_group=$gateway_group&pool=Default"

done


