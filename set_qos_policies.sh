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

if [$1 = ""]||[$2 = ""]||[$3 = ""] ; then
		echo "Please use ./create_nas_folder.sh -v to check version"
        echo "Please use ./set_qos_policies.sh {ip} {virtual_storage} {dir or file or all}"
        echo "e.g., ./create_nas_folder.sh 1.1.1.1 myVS dir"
        exit 0
fi
ip=$1
gateway_group=$2
dir_or_file=$3
echo ip = $ip
echo virtual storage = $gateway_group
echo login...
curl --cookie-jar ezstor.cookie --insecure "https://$ip:8080/cgi-bin/ezs3/login?user_id=admin&password=admin"
#echo call write_policies
#if [$dir_or_file=dir]; then
#./write_policies_dir.sh $gateway_group
#else
#./write_policies_file.sh $gateway_group
#echo setting qos policies...

if [ "$dir_or_file" == "dir" ]; then
	curl --cookie ezstor.cookie --insecure -F enable=@enable -F gateway_group=@gateway_group -F policies=@policies_dir https://$ip:8080/cgi-bin/ezs3/set_qos_policies

elif [ "$dir_or_file" == "all" ]; then
        curl --cookie ezstor.cookie --insecure -F enable=@enable -F gateway_group=@gateway_group -F policies=@policies_all https://$ip:8080/cgi-bin/ezs3/set_qos_policies
else
	curl --cookie ezstor.cookie --insecure -F enable=@enable -F gateway_group=@gateway_group -F policies=@policies_file https://$ip:8080/cgi-bin/ezs3/set_qos_policies

fi


