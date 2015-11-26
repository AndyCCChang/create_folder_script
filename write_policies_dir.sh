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

if [ "$1" == "" ] ; then
		echo "Please use ./create_nas_folder.sh -v to check version"
        echo "Please use ./write_policies_dir.sh {virtual_storage}"
        echo "e.g., ./write_policies_dir.sh myVS"
        exit 0
fi

policies=policies_dir
enableT="enable"
gateway_group="gateway_group"
virtual_storage=$1
echo $virtual_storage

if [ -f "$policies" ] ; then
	rm $policies
fi

if [ ! -f "$enable" ] ; then
         # if not create the file
         echo -n "true" > $enableT
fi

#if [ ! -f "$gateway_group" ] ; then
         # if not create the file
echo -n "$virtual_storage"  > $gateway_group
#fi


echo -n "[" >> $policies
for ((i=1; i<=1024; i=i+1))
do
if [ $i -eq 1024 ] ; then
    echo -n "{\"path\":\"t1/f$i\",\"type\":\"dir\",\"maxbw\":250,\"maxiops\":\"20\"}" >> $policies
else
    echo -n "{\"path\":\"t1/f$i\",\"type\":\"dir\",\"maxbw\":250,\"maxiops\":\"20\"}," >> $policies
fi

done
echo "]" >> $policies

