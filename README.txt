1. Create 999 folders
Please use ./create_nas_folder.sh {ip} {virtual_storage}
e.g., #./create_nas_folder.sh 1.1.1.1 myVS

2. Set QoS policies t1/f1~1024, t1/a1.mp3~a1024.mp3
Please use ./write_policies_dir.sh {virtual_storage}
e.g., #./write_policies_dir.sh myVS

2.2.
Please use ./write_policies_file.sh {virtual_storage}
e.g., #./write_policies_dir.sh myVS

2.3.
Please use ./set_qos_policies.sh {ip} {virtual_storage} {dir or file or all}
e.g., #./create_nas_folder.sh 1.1.1.1 myVS dir



