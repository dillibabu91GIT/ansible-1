#!/bin/bash

Profile_home="$1"
zip_file_url="$2"
zip_file_name="$3"

# Backup directory
backup_dir="$Profile_home/backup"
mkdir -p "$backup_dir"

# Remove the existing release directory if it exists
rm -rf "$Profile_home/release"

# Use unzip to extract contents into the specified directory
unzip -q "$Profile_home/$zip_file_name" -d "$Profile_home/"

# List files after extraction in the specified path
ls -la "$Profile_home/release"
ls -la "$Profile_home/release/WFS.ear"

# Read the content of release.txt
release_content=$(cat "$Profile_home/release/release.txt" 2>/dev/null)

# Print the content of release_content
echo "$release_content"

# Deploy new files for each application
if [ -n "$release_content" ]; then
    targeted_location="$targeted_location"

    # Iterate through each line in release_content
    while IFS=, read -r app_name app_targeted_location; do
        # Check if the app_targeted_location is not empty
        if [ -n "$app_targeted_location" ]; then
            # Define paths for new deployment files, targeted location, and backup
            new_deployment_path="$Profile_home/release/$app_name"  # Assuming the new files are in the release directory
            targeted_path="$targeted_location/$app_targeted_location"
            backup_path="$backup_dir/$app_name"

            # Create a backup of the existing files
            cp -r "$targeted_path" "$backup_path"

            # Print information about the backup
            echo "Backup: $app_name - $targeted_path -> $backup_path"
            
            # List files in the backup directory
            echo "Backup files for $app_name:"
            ls -la "$backup_path"

            # Copy new deployment files to targeted location
            cp -r "$new_deployment_path" "$targeted_path"

            # Print information about the copy
            echo "Copy: $app_name - $new_deployment_path -> $targeted_path"
        fi
    done <<< "$release_content"
fi
Run cd /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd
ansible-playbook 2.8.18
  config file = /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/ansible.cfg
  configured module search path = ['/home/itdevtra/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.6/site-packages/ansible
  executable location = /usr/bin/ansible-playbook
  python version = 3.6.8 (default, Jan 14 2022, 11:04:20) [GCC 8.5.0 20210514 (Red Hat 8.5.0-7)]
Using /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/ansible.cfg as config file
host_list declined parsing /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/hosts.cfg as it did not pass it's verify_file() method
script declined parsing /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/hosts.cfg as it did not pass it's verify_file() method
auto declined parsing /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/hosts.cfg as it did not pass it's verify_file() method
yaml declined parsing /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/hosts.cfg as it did not pass it's verify_file() method
Parsed /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/hosts.cfg inventory source with ini plugin

PLAYBOOK: IBPS-deployment.yml **************************************************
1 plays in ./playbook/IBPS-deployment.yml

PLAY [target_jb] ***************************************************************

TASK [Gathering Facts] *********************************************************
task path: /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/playbook/IBPS-deployment.yml:1
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'( umask 77 && mkdir -p "` echo /tmp `"&& mkdir /tmp/ansible-tmp-1706859745.3966923-110886-2346024750462 && echo ansible-tmp-1706859745.3966923-110886-2346024750462="` echo /tmp/ansible-tmp-1706859745.3966923-110886-2346024750462 `" ) && sleep 0'"'"''
<10.15.13.148> (0, b'ansible-tmp-1706859745.3966923-110886-2346024750462=/tmp/ansible-tmp-1706859745.3966923-110886-2346024750462\n', b'')
<ANT3CASAPPS01> Attempting python interpreter discovery
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'echo PLATFORM; uname; echo FOUND; command -v '"'"'"'"'"'"'"'"'/usr/bin/python'"'"'"'"'"'"'"'"'; command -v '"'"'"'"'"'"'"'"'python3.7'"'"'"'"'"'"'"'"'; command -v '"'"'"'"'"'"'"'"'python3.6'"'"'"'"'"'"'"'"'; command -v '"'"'"'"'"'"'"'"'python3.5'"'"'"'"'"'"'"'"'; command -v '"'"'"'"'"'"'"'"'python2.7'"'"'"'"'"'"'"'"'; command -v '"'"'"'"'"'"'"'"'python2.6'"'"'"'"'"'"'"'"'; command -v '"'"'"'"'"'"'"'"'/usr/libexec/platform-python'"'"'"'"'"'"'"'"'; command -v '"'"'"'"'"'"'"'"'/usr/bin/python3'"'"'"'"'"'"'"'"'; command -v '"'"'"'"'"'"'"'"'python'"'"'"'"'"'"'"'"'; echo ENDFOUND && sleep 0'"'"''
<10.15.13.148> (0, b'PLATFORM\nLinux\nFOUND\n/usr/bin/python\n/usr/bin/python2.7\n/usr/libexec/platform-python\n/usr/bin/python\nENDFOUND\n', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'/usr/bin/python && sleep 0'"'"''
<10.15.13.148> (0, b'{"osrelease_content": "NAME=\\"Red Hat Enterprise Linux Server\\"\\nVERSION=\\"7.9 (Maipo)\\"\\nID=\\"rhel\\"\\nID_LIKE=\\"fedora\\"\\nVARIANT=\\"Server\\"\\nVARIANT_ID=\\"server\\"\\nVERSION_ID=\\"7.9\\"\\nPRETTY_NAME=RHEL\\nANSI_COLOR=\\"0;31\\"\\nCPE_NAME=\\"cpe:/o:redhat:enterprise_linux:7.9:GA:server\\"\\nHOME_URL=\\"https://www.redhat.com/\\"\\nBUG_REPORT_URL=\\"https://bugzilla.redhat.com/\\"\\n\\nREDHAT_BUGZILLA_PRODUCT=\\"Red Hat Enterprise Linux 7\\"\\nREDHAT_BUGZILLA_PRODUCT_VERSION=7.9\\nREDHAT_SUPPORT_PRODUCT=\\"Red Hat Enterprise Linux\\"\\nREDHAT_SUPPORT_PRODUCT_VERSION=\\"7.9\\"\\n", "platform_dist_result": ["redhat", "7.9", "Maipo"]}\n', b'')
Using module file /usr/lib/python3.6/site-packages/ansible/modules/system/setup.py
<10.15.13.148> PUT /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmp0axomx_l TO /tmp/ansible-tmp-1706859745.3966923-110886-2346024750462/AnsiballZ_setup.py
<10.15.13.148> SSH: EXEC sftp -b - -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a '[10.15.13.148]'
<10.15.13.148> (0, b'sftp> put /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmp0axomx_l /tmp/ansible-tmp-1706859745.3966923-110886-2346024750462/AnsiballZ_setup.py\n', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'chmod u+x /tmp/ansible-tmp-1706859745.3966923-110886-2346024750462/ /tmp/ansible-tmp-1706859745.3966923-110886-2346024750462/AnsiballZ_setup.py && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a -tt 10.15.13.148 '/bin/sh -c '"'"'/usr/bin/python /tmp/ansible-tmp-1706859745.3966923-110886-2346024750462/AnsiballZ_setup.py && sleep 0'"'"''
<10.15.13.148> (0, b'\r\n{"invocation": {"module_args": {"filter": "*", "gather_subset": ["all"], "fact_path": "/etc/ansible/facts.d", "gather_timeout": 10}}, "ansible_facts": {"ansible_fibre_channel_wwn": [], "module_setup": true, "ansible_distribution_version": "7.9", "ansible_distribution_file_variety": "RedHat", "ansible_env": {"LANG": "C", "LC_NUMERIC": "C", "TERM": "xterm", "SHELL": "/bin/bash", "XDG_RUNTIME_DIR": "/run/user/1012", "SHLVL": "2", "SSH_TTY": "/dev/pts/0", "PWD": "/home/itdevtra", "LESSOPEN": "||/usr/bin/lesspipe.sh %s", "XDG_SESSION_ID": "1029879", "SSH_CLIENT": "10.15.14.105 46452 22", "LOGNAME": "itdevtra", "USER": "itdevtra", "MAIL": "/var/mail/itdevtra", "PATH": "/usr/local/bin:/usr/bin", "LS_COLORS": "rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wav=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:", "HOME": "/home/itdevtra", "LC_ALL": "C", "_": "/usr/bin/python", "SSH_CONNECTION": "10.15.14.105 46452 10.15.13.148 22"}, "ansible_userspace_bits": "64", "ansible_architecture": "x86_64", "ansible_default_ipv4": {"macaddress": "00:50:56:93:44:68", "network": "10.15.13.0", "mtu": 1500, "broadcast": "10.15.13.255", "alias": "eth0", "netmask": "255.255.255.0", "address": "10.15.13.148", "interface": "eth0", "type": "ether", "gateway": "10.15.13.1"}, "ansible_swapfree_mb": 4095, "ansible_default_ipv6": {}, "ansible_cmdline": {"audit": "1", "LANG": "en_US.UTF-8", "BOOT_IMAGE": "/vmlinuz-3.10.0-1160.71.1.el7.x86_64", "quiet": true, "net.ifnames": "0", "rhgb": true, "rd.lvm.lv": "rootvg/swap", "crashkernel": "auto", "biosdevname": "0", "ro": true, "root": "/dev/mapper/rootvg-root"}, "ansible_machine_id": "5c34f87e3d7f4c30bc29a3dc62dc4c90", "ansible_userspace_architecture": "x86_64", "ansible_product_uuid": "NA", "ansible_pkg_mgr": "yum", "ansible_distribution": "RedHat", "ansible_iscsi_iqn": "", "ansible_all_ipv6_addresses": ["fe80::250:56ff:fe93:4468"], "ansible_uptime_seconds": 41519096, "ansible_kernel": "3.10.0-1160.71.1.el7.x86_64", "ansible_system_capabilities_enforced": "True", "ansible_python": {"executable": "/usr/bin/python", "version": {"micro": 5, "major": 2, "releaselevel": "final", "serial": 0, "minor": 7}, "type": "CPython", "has_sslcontext": true, "version_info": [2, 7, 5, "final", 0]}, "ansible_is_chroot": true, "ansible_hostnqn": "", "ansible_user_shell": "/bin/bash", "ansible_product_serial": "NA", "ansible_form_factor": "Other", "ansible_distribution_file_parsed": true, "ansible_fips": false, "ansible_user_id": "itdevtra", "ansible_selinux_python_present": true, "ansible_local": {}, "ansible_processor_vcpus": 3, "ansible_processor": ["0", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2640 v4 @ 2.40GHz", "1", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2640 v4 @ 2.40GHz", "2", "GenuineIntel", "Intel(R) Xeon(R) CPU E5-2640 v4 @ 2.40GHz"], "ansible_ssh_host_key_ecdsa_public": "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBIGNb9C33UvLvd6qy+DXMHHjFrYIMXOTy1E6SVOCyQSVuWZvm7E1WPjRpJKOG9uRXqcJo33GIzv8n3fSoCNC6/I=", "ansible_user_gid": 1013, "ansible_system_vendor": "VMware, Inc.", "ansible_swaptotal_mb": 4095, "ansible_distribution_major_version": "7", "ansible_real_group_id": 1013, "ansible_lsb": {}, "ansible_machine": "x86_64", "ansible_ssh_host_key_rsa_public": "AAAAB3NzaC1yc2EAAAADAQABAAABAQCxexwR4DaqER27BcRaSAwt/lUuliY1BndgPLTWFXT6ESbiCsciICVDmJ/qKWfstp6/Ej90WmInzcitp3QxALYgW9wXawvxyveGW2CN8WrXSYIiCNjj7Dn+qUIYytBeNgNQI+EIUpQOEJzh9x1RvrnH5hw6c9wHs4kVvztLlSFS5TAHCjgH0osr1UXY/27hbsgLfMoUG1mPGrkW9ZhKDSLkwf2+XK4ZCzD9JNyNcFlx3XSvOrIUAn+7Nqul783cuxnnfvV9Egs3tq7z9tCJhtf8fJI/pQEsKJbW7yvGKKks6JsFwWBmQRmYKbV+QjowHqnrYSWf7dUtwaRDg/BfiROX", "ansible_user_gecos": "HD#4137020, Pradip K, 03Jan2024 --ARC", "ansible_processor_threads_per_core": 1, "ansible_eth0": {"macaddress": "00:50:56:93:44:68", "features": {"tx_checksum_ipv4": "off [fixed]", "generic_receive_offload": "on", "tx_checksum_ipv6": "off [fixed]", "tx_scatter_gather_fraglist": "off [fixed]", "rx_all": "off [fixed]", "highdma": "on", "rx_fcs": "off [fixed]", "tx_lockless": "off [fixed]", "tx_tcp_ecn_segmentation": "off [fixed]", "rx_udp_tunnel_port_offload": "off [fixed]", "tx_tcp6_segmentation": "on", "tx_gso_robust": "off [fixed]", "tx_ipip_segmentation": "off [fixed]", "tx_tcp_mangleid_segmentation": "off", "tx_checksumming": "on", "vlan_challenged": "off [fixed]", "loopback": "off [fixed]", "fcoe_mtu": "off [fixed]", "scatter_gather": "on", "tx_checksum_sctp": "off [fixed]", "tx_vlan_stag_hw_insert": "off [fixed]", "rx_vlan_stag_hw_parse": "off [fixed]", "tx_gso_partial": "off [fixed]", "rx_gro_hw": "off [fixed]", "rx_vlan_stag_filter": "off [fixed]", "large_receive_offload": "on", "tx_scatter_gather": "on", "rx_checksumming": "on", "tx_tcp_segmentation": "on", "netns_local": "off [fixed]", "busy_poll": "off [fixed]", "generic_segmentation_offload": "on", "tx_udp_tnl_segmentation": "off [fixed]", "tcp_segmentation_offload": "on", "l2_fwd_offload": "off [fixed]", "rx_vlan_offload": "on", "ntuple_filters": "off [fixed]", "tx_gre_csum_segmentation": "off [fixed]", "tx_nocache_copy": "off", "tx_udp_tnl_csum_segmentation": "off [fixed]", "udp_fragmentation_offload": "off [fixed]", "tx_sctp_segmentation": "off [fixed]", "tx_sit_segmentation": "off [fixed]", "tx_checksum_fcoe_crc": "off [fixed]", "hw_tc_offload": "off [fixed]", "tx_checksum_ip_generic": "on", "tx_fcoe_segmentation": "off [fixed]", "rx_vlan_filter": "on [fixed]", "tx_vlan_offload": "on", "receive_hashing": "on", "tx_gre_segmentation": "off [fixed]"}, "type": "ether", "pciid": "0000:0b:00.0", "module": "vmxnet3", "mtu": 1500, "device": "eth0", "promisc": false, "timestamping": ["rx_software", "software"], "ipv4": {"broadcast": "10.15.13.255", "netmask": "255.255.255.0", "network": "10.15.13.0", "address": "10.15.13.148"}, "ipv6": [{"scope": "link", "prefix": "64", "address": "fe80::250:56ff:fe93:4468"}], "active": true, "speed": 10000, "hw_timestamp_filters": []}, "ansible_product_name": "VMware Virtual Platform", "ansible_all_ipv4_addresses": ["10.15.13.148"], "ansible_python_version": "2.7.5", "ansible_product_version": "None", "ansible_service_mgr": "systemd", "ansible_memory_mb": {"real": {"total": 7802, "used": 6507, "free": 1295}, "swap": {"cached": 0, "total": 4095, "free": 4095, "used": 0}, "nocache": {"used": 3688, "free": 4114}}, "ansible_user_dir": "/home/itdevtra", "gather_subset": ["all"], "ansible_real_user_id": 1012, "ansible_virtualization_role": "guest", "ansible_dns": {"search": ["rakbanktst.ae"]}, "ansible_effective_group_id": 1013, "ansible_lo": {"features": {"tx_checksum_ipv4": "off [fixed]", "generic_receive_offload": "on", "tx_checksum_ipv6": "off [fixed]", "tx_scatter_gather_fraglist": "on [fixed]", "rx_all": "off [fixed]", "highdma": "on [fixed]", "rx_fcs": "off [fixed]", "tx_lockless": "on [fixed]", "tx_tcp_ecn_segmentation": "on", "rx_udp_tunnel_port_offload": "off [fixed]", "tx_tcp6_segmentation": "on", "tx_gso_robust": "off [fixed]", "tx_ipip_segmentation": "off [fixed]", "tx_tcp_mangleid_segmentation": "on", "tx_checksumming": "on", "vlan_challenged": "on [fixed]", "loopback": "on [fixed]", "fcoe_mtu": "off [fixed]", "scatter_gather": "on", "tx_checksum_sctp": "on [fixed]", "tx_vlan_stag_hw_insert": "off [fixed]", "rx_vlan_stag_hw_parse": "off [fixed]", "tx_gso_partial": "off [fixed]", "rx_gro_hw": "off [fixed]", "rx_vlan_stag_filter": "off [fixed]", "large_receive_offload": "off [fixed]", "tx_scatter_gather": "on [fixed]", "rx_checksumming": "on [fixed]", "tx_tcp_segmentation": "on", "netns_local": "on [fixed]", "busy_poll": "off [fixed]", "generic_segmentation_offload": "on", "tx_udp_tnl_segmentation": "off [fixed]", "tcp_segmentation_offload": "on", "l2_fwd_offload": "off [fixed]", "rx_vlan_offload": "off [fixed]", "ntuple_filters": "off [fixed]", "tx_gre_csum_segmentation": "off [fixed]", "tx_nocache_copy": "off [fixed]", "tx_udp_tnl_csum_segmentation": "off [fixed]", "udp_fragmentation_offload": "on", "tx_sctp_segmentation": "on", "tx_sit_segmentation": "off [fixed]", "tx_checksum_fcoe_crc": "off [fixed]", "hw_tc_offload": "off [fixed]", "tx_checksum_ip_generic": "on [fixed]", "tx_fcoe_segmentation": "off [fixed]", "rx_vlan_filter": "off [fixed]", "tx_vlan_offload": "off [fixed]", "receive_hashing": "off [fixed]", "tx_gre_segmentation": "off [fixed]"}, "hw_timestamp_filters": [], "mtu": 65536, "device": "lo", "promisc": false, "timestamping": ["rx_software", "software"], "ipv4": {"broadcast": "host", "netmask": "255.0.0.0", "network": "127.0.0.0", "address": "127.0.0.1"}, "ipv6": [{"scope": "host", "prefix": "128", "address": "::1"}], "active": true, "type": "loopback"}, "ansible_memtotal_mb": 7802, "ansible_device_links": {"masters": {"sda2": ["dm-0", "dm-1", "dm-10", "dm-2", "dm-3", "dm-4", "dm-5", "dm-6", "dm-7", "dm-8", "dm-9"], "sdc": ["dm-11"]}, "labels": {"dm-8": ["infralv"], "dm-6": ["tmplv"], "dm-7": ["usrlocallv"], "dm-4": ["varlv"], "dm-5": ["optlv"], "dm-2": ["swaplv"], "dm-3": ["homelv"], "dm-0": ["usrlv"], "dm-1": ["rootlv"]}, "ids": {"dm-10": ["dm-name-rootvg-imagevol", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3Ql7rIqNB0HSAhRKnaJPy0x2WI515sgue"], "dm-11": ["dm-name-datavg-ibmlv", "dm-uuid-LVM-MHvJ0l703hIehaFWOnVwCErHWuH4FX6tLVTkLxXYl53pokeGLn7mPdeyqUk13TmP"], "sdc": ["lvm-pv-uuid-MWqEOW-8qfP-Sbqs-saJC-toUx-qMdp-WehwlG"], "dm-3": ["dm-name-rootvg-home", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3arM0HTNGEpU0MEFfo6QmG4Nl4v18f97l"], "sr0": ["ata-VMware_Virtual_IDE_CDROM_Drive_10000000000000000001"], "sda2": ["lvm-pv-uuid-mCka0a-OhV0-xtpc-aWn1-3qmr-xfoc-hrfRLP"], "dm-8": ["dm-name-rootvg-infra", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s30hIPlOU8bAUdI8f1Q2nOIxkxWfO5NqGs"], "dm-9": ["dm-name-rootvg-auditlv", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3oMGGvpdrjCzgnZJNw8TgGQoa90dMXU7B"], "dm-6": ["dm-name-rootvg-tmp", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3WA68KF1CEFDP9ssFj4SxN8ApKfoYDstO"], "dm-7": ["dm-name-rootvg-usr_local", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3qbpJ3kJv2tyF3xNNYW9cNNXn4LD2YfPL"], "sdb": ["lvm-pv-uuid-jbiHkr-Z16K-zxXZ-q9Y9-h09Q-ZTPP-XUVh2z"], "dm-5": ["dm-name-rootvg-opt", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s32hxpCz5i3d9T528ZMZeyjsCgAXrgXzLf"], "dm-2": ["dm-name-rootvg-swap", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3L54kBGavMAWPALMS8nLQpRTLJpUrYXfe"], "dm-4": ["dm-name-rootvg-var", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3IiF4iWRFufpNSkSFXD9yuOMy1B29I3x6"], "dm-0": ["dm-name-rootvg-usr", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3Df3rN5A6h6obvkPqzn6hsgqD3Ti0bAnz"], "dm-1": ["dm-name-rootvg-root", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s39S8BbbeX5lPkKxNBfFl9CRZGqaXHfmol"]}, "uuids": {"dm-10": ["b2958497-bc4e-4a59-990a-4b6cc3548081"], "dm-11": ["418ddb96-3f8d-49a7-a2d0-70d7c56c932f"], "sda1": ["e449802f-069b-40de-adf2-a4438d695981"], "dm-8": ["fdc99aa9-e3e3-4fa5-b8d8-da4d2eb12236"], "dm-9": ["3ff45aba-5037-4add-998f-bc24a76c7851"], "dm-6": ["13b0d8a3-0d9e-4045-870d-e07fbfe9d2ac"], "dm-7": ["d345b573-608c-4386-9379-e692c2146708"], "dm-4": ["80d24a27-d3d5-46cf-8e44-ef9f5fe8eac5"], "dm-5": ["df4187bc-989b-4b80-8681-f421d0c581aa"], "dm-2": ["3bca2544-619b-4bb1-8e17-5f89a31263b0"], "dm-3": ["9864bb7c-ba12-4b1d-878e-d89017a91edb"], "dm-0": ["abd30de1-b50b-4a90-babe-502491022aac"], "dm-1": ["1ff70062-11f6-4341-947a-44d31bf499d3"]}}, "ansible_apparmor": {"status": "disabled"}, "ansible_proc_cmdline": {"audit": "1", "LANG": "en_US.UTF-8", "BOOT_IMAGE": "/vmlinuz-3.10.0-1160.71.1.el7.x86_64", "quiet": true, "net.ifnames": "0", "rhgb": true, "rd.lvm.lv": ["rootvg/usr", "rootvg/root", "rootvg/swap"], "crashkernel": "auto", "biosdevname": "0", "ro": true, "root": "/dev/mapper/rootvg-root"}, "ansible_memfree_mb": 1295, "ansible_processor_count": 1, "ansible_hostname": "ANT3CASAPPS01", "ansible_interfaces": ["lo", "eth0"], "ansible_selinux": {"status": "disabled"}, "ansible_fqdn": "ANT3CASAPPS01.rakbanktst.ae", "ansible_mounts": [{"block_used": 1037194, "uuid": "abd30de1-b50b-4a90-babe-502491022aac", "size_total": 6431965184, "block_total": 1570304, "mount": "/usr", "block_available": 533110, "size_available": 2183618560, "fstype": "xfs", "inode_total": 6291456, "options": "rw,relatime,attr2,inode64,noquota", "device": "/dev/mapper/rootvg-usr", "inode_used": 113266, "block_size": 4096, "inode_available": 6178190}, {"block_used": 54799, "uuid": "e449802f-069b-40de-adf2-a4438d695981", "size_total": 1063256064, "block_total": 259584, "mount": "/boot", "block_available": 204785, "size_available": 838799360, "fstype": "xfs", "inode_total": 1048576, "options": "rw,relatime,attr2,inode64,noquota", "device": "/dev/sda1", "inode_used": 345, "block_size": 4096, "inode_available": 1048231}, {"block_used": 383640, "uuid": "1ff70062-11f6-4341-947a-44d31bf499d3", "size_total": 4284481536, "block_total": 1046016, "mount": "/", "block_available": 662376, "size_available": 2713092096, "fstype": "xfs", "inode_total": 4194304, "options": "rw,relatime,attr2,inode64,noquota", "device": "/dev/mapper/rootvg-root", "inode_used": 8834, "block_size": 4096, "inode_available": 4185470}, {"block_used": 35403, "uuid": "13b0d8a3-0d9e-4045-870d-e07fbfe9d2ac", "size_total": 3210739712, "block_total": 783872, "mount": "/tmp", "block_available": 748469, "size_available": 3065729024, "fstype": "xfs", "inode_total": 3145728, "options": "rw,nosuid,nodev,relatime,attr2,inode64,noquota", "device": "/dev/mapper/rootvg-tmp", "inode_used": 500, "block_size": 4096, "inode_available": 3145228}, {"block_used": 278439, "uuid": "fdc99aa9-e3e3-4fa5-b8d8-da4d2eb12236", "size_total": 3210739712, "block_total": 783872, "mount": "/infra", "block_available": 505433, "size_available": 2070253568, "fstype": "xfs", "inode_total": 3145728, "options": "rw,relatime,attr2,inode64,noquota", "device": "/dev/mapper/rootvg-infra", "inode_used": 5677, "block_size": 4096, "inode_available": 3140051}, {"block_used": 285927, "uuid": "df4187bc-989b-4b80-8681-f421d0c581aa", "size_total": 4284481536, "block_total": 1046016, "mount": "/opt", "block_available": 760089, "size_available": 3113324544, "fstype": "xfs", "inode_total": 4194304, "options": "rw,relatime,attr2,inode64,noquota", "device": "/dev/mapper/rootvg-opt", "inode_used": 4783, "block_size": 4096, "inode_available": 4189521}, {"block_used": 435281, "uuid": "80d24a27-d3d5-46cf-8e44-ef9f5fe8eac5", "size_total": 6431965184, "block_total": 1570304, "mount": "/var", "block_available": 1135023, "size_available": 4649054208, "fstype": "xfs", "inode_total": 6291456, "options": "rw,relatime,attr2,inode64,noquota", "device": "/dev/mapper/rootvg-var", "inode_used": 7948, "block_size": 4096, "inode_available": 6283508}, {"block_used": 20977, "uuid": "9864bb7c-ba12-4b1d-878e-d89017a91edb", "size_total": 3210739712, "block_total": 783872, "mount": "/home", "block_available": 762895, "size_available": 3124817920, "fstype": "xfs", "inode_total": 3145728, "options": "rw,nodev,relatime,attr2,inode64,noquota", "device": "/dev/mapper/rootvg-home", "inode_used": 294, "block_size": 4096, "inode_available": 3145434}, {"block_used": 64136, "uuid": "d345b573-608c-4386-9379-e692c2146708", "size_total": 1063256064, "block_total": 259584, "mount": "/usr/local", "block_available": 195448, "size_available": 800555008, "fstype": "xfs", "inode_total": 1048576, "options": "rw,relatime,attr2,inode64,noquota", "device": "/dev/mapper/rootvg-usr_local", "inode_used": 982, "block_size": 4096, "inode_available": 1047594}, {"block_used": 259579, "uuid": "3ff45aba-5037-4add-998f-bc24a76c7851", "size_total": 1063256064, "block_total": 259584, "mount": "/var/log/audit", "block_available": 5, "size_available": 20480, "fstype": "xfs", "inode_total": 144, "options": "rw,relatime,attr2,inode64,noquota", "device": "/dev/mapper/rootvg-auditlv", "inode_used": 20, "block_size": 4096, "inode_available": 124}, {"block_used": 9183864, "uuid": "418ddb96-3f8d-49a7-a2d0-70d7c56c932f", "size_total": 52710469632, "block_total": 12868767, "mount": "/ibm", "block_available": 3684903, "size_available": 15093362688, "fstype": "ext3", "inode_total": 3276800, "options": "rw,relatime,data=ordered", "device": "/dev/mapper/datavg-ibmlv", "inode_used": 108074, "block_size": 4096, "inode_available": 3168726}], "ansible_nodename": "ANT3CASAPPS01", "ansible_distribution_file_search_string": "Red Hat", "ansible_domain": "rakbanktst.ae", "ansible_distribution_file_path": "/etc/redhat-release", "ansible_virtualization_type": "VMware", "ansible_ssh_host_key_ed25519_public": "AAAAC3NzaC1lZDI1NTE5AAAAIKwzZ7pU9PaBYkkfs7IWLOec1NnB/d653wIqxYfbswfX", "ansible_processor_cores": 3, "ansible_bios_version": "6.00", "ansible_date_time": {"weekday_number": "5", "iso8601_basic_short": "20240202T114341", "tz": "+04", "weeknumber": "05", "hour": "11", "year": "2024", "minute": "43", "tz_offset": "+0400", "month": "02", "epoch": "1706859821", "iso8601_micro": "2024-02-02T07:43:41.034509Z", "weekday": "Friday", "time": "11:43:41", "date": "2024-02-02", "iso8601": "2024-02-02T07:43:41Z", "day": "02", "iso8601_basic": "20240202T114341034371", "second": "41"}, "ansible_distribution_release": "Maipo", "ansible_os_family": "RedHat", "ansible_effective_user_id": 1012, "ansible_system": "Linux", "ansible_devices": {"dm-10": {"scheduler_mode": "", "rotational": "1", "vendor": null, "sectors": "14680064", "links": {"masters": [], "labels": [], "ids": ["dm-name-rootvg-imagevol", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3Ql7rIqNB0HSAhRKnaJPy0x2WI515sgue"], "uuids": ["b2958497-bc4e-4a59-990a-4b6cc3548081"]}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": null, "partitions": {}, "holders": [], "size": "7.00 GB"}, "dm-11": {"scheduler_mode": "", "rotational": "1", "vendor": null, "sectors": "104857600", "links": {"masters": [], "labels": [], "ids": ["dm-name-datavg-ibmlv", "dm-uuid-LVM-MHvJ0l703hIehaFWOnVwCErHWuH4FX6tLVTkLxXYl53pokeGLn7mPdeyqUk13TmP"], "uuids": ["418ddb96-3f8d-49a7-a2d0-70d7c56c932f"]}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": null, "partitions": {}, "holders": [], "size": "50.00 GB"}, "sdc": {"scheduler_mode": "deadline", "rotational": "1", "vendor": "VMware", "sectors": "293601280", "links": {"masters": ["dm-11"], "labels": [], "ids": ["lvm-pv-uuid-MWqEOW-8qfP-Sbqs-saJC-toUx-qMdp-WehwlG"], "uuids": []}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "Serial Attached SCSI controller: VMware PVSCSI SCSI Controller (rev 02)", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": "Virtual disk", "partitions": {}, "holders": ["datavg-ibmlv"], "size": "140.00 GB"}, "sr0": {"scheduler_mode": "deadline", "rotational": "1", "vendor": "NECVMWar", "sectors": "2097151", "links": {"masters": [], "labels": [], "ids": ["ata-VMware_Virtual_IDE_CDROM_Drive_10000000000000000001"], "uuids": []}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE (rev 01)", "sectorsize": "512", "removable": "1", "support_discard": "0", "model": "VMware IDE CDR10", "partitions": {}, "holders": [], "size": "1024.00 MB"}, "sdb": {"scheduler_mode": "deadline", "rotational": "1", "vendor": "VMware", "sectors": "41943040", "links": {"masters": [], "labels": [], "ids": ["lvm-pv-uuid-jbiHkr-Z16K-zxXZ-q9Y9-h09Q-ZTPP-XUVh2z"], "uuids": []}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "Serial Attached SCSI controller: VMware PVSCSI SCSI Controller (rev 02)", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": "Virtual disk", "partitions": {}, "holders": [], "size": "20.00 GB"}, "sda": {"scheduler_mode": "deadline", "rotational": "1", "vendor": "VMware", "sectors": "104857600", "links": {"masters": [], "labels": [], "ids": [], "uuids": []}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "Serial Attached SCSI controller: VMware PVSCSI SCSI Controller (rev 02)", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": "Virtual disk", "partitions": {"sda2": {"sectorsize": 512, "uuid": null, "links": {"masters": ["dm-0", "dm-1", "dm-10", "dm-2", "dm-3", "dm-4", "dm-5", "dm-6", "dm-7", "dm-8", "dm-9"], "labels": [], "ids": ["lvm-pv-uuid-mCka0a-OhV0-xtpc-aWn1-3qmr-xfoc-hrfRLP"], "uuids": []}, "sectors": "102758400", "start": "2099200", "holders": ["rootvg-usr", "rootvg-root", "rootvg-swap", "rootvg-home", "rootvg-var", "rootvg-opt", "rootvg-tmp", "rootvg-usr_local", "rootvg-infra", "rootvg-auditlv", "rootvg-imagevol"], "size": "49.00 GB"}, "sda1": {"sectorsize": 512, "uuid": "e449802f-069b-40de-adf2-a4438d695981", "links": {"masters": [], "labels": [], "ids": [], "uuids": ["e449802f-069b-40de-adf2-a4438d695981"]}, "sectors": "2097152", "start": "2048", "holders": [], "size": "1.00 GB"}}, "holders": [], "size": "50.00 GB"}, "dm-8": {"scheduler_mode": "", "rotational": "1", "vendor": null, "sectors": "6291456", "links": {"masters": [], "labels": ["infralv"], "ids": ["dm-name-rootvg-infra", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s30hIPlOU8bAUdI8f1Q2nOIxkxWfO5NqGs"], "uuids": ["fdc99aa9-e3e3-4fa5-b8d8-da4d2eb12236"]}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": null, "partitions": {}, "holders": [], "size": "3.00 GB"}, "dm-9": {"scheduler_mode": "", "rotational": "1", "vendor": null, "sectors": "2097152", "links": {"masters": [], "labels": [], "ids": ["dm-name-rootvg-auditlv", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3oMGGvpdrjCzgnZJNw8TgGQoa90dMXU7B"], "uuids": ["3ff45aba-5037-4add-998f-bc24a76c7851"]}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": null, "partitions": {}, "holders": [], "size": "1.00 GB"}, "dm-6": {"scheduler_mode": "", "rotational": "1", "vendor": null, "sectors": "6291456", "links": {"masters": [], "labels": ["tmplv"], "ids": ["dm-name-rootvg-tmp", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3WA68KF1CEFDP9ssFj4SxN8ApKfoYDstO"], "uuids": ["13b0d8a3-0d9e-4045-870d-e07fbfe9d2ac"]}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": null, "partitions": {}, "holders": [], "size": "3.00 GB"}, "dm-7": {"scheduler_mode": "", "rotational": "1", "vendor": null, "sectors": "2097152", "links": {"masters": [], "labels": ["usrlocallv"], "ids": ["dm-name-rootvg-usr_local", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3qbpJ3kJv2tyF3xNNYW9cNNXn4LD2YfPL"], "uuids": ["d345b573-608c-4386-9379-e692c2146708"]}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": null, "partitions": {}, "holders": [], "size": "1.00 GB"}, "dm-4": {"scheduler_mode": "", "rotational": "1", "vendor": null, "sectors": "12582912", "links": {"masters": [], "labels": ["varlv"], "ids": ["dm-name-rootvg-var", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3IiF4iWRFufpNSkSFXD9yuOMy1B29I3x6"], "uuids": ["80d24a27-d3d5-46cf-8e44-ef9f5fe8eac5"]}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": null, "partitions": {}, "holders": [], "size": "6.00 GB"}, "dm-5": {"scheduler_mode": "", "rotational": "1", "vendor": null, "sectors": "8388608", "links": {"masters": [], "labels": ["optlv"], "ids": ["dm-name-rootvg-opt", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s32hxpCz5i3d9T528ZMZeyjsCgAXrgXzLf"], "uuids": ["df4187bc-989b-4b80-8681-f421d0c581aa"]}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": null, "partitions": {}, "holders": [], "size": "4.00 GB"}, "dm-2": {"scheduler_mode": "", "rotational": "1", "vendor": null, "sectors": "8388608", "links": {"masters": [], "labels": ["swaplv"], "ids": ["dm-name-rootvg-swap", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3L54kBGavMAWPALMS8nLQpRTLJpUrYXfe"], "uuids": ["3bca2544-619b-4bb1-8e17-5f89a31263b0"]}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": null, "partitions": {}, "holders": [], "size": "4.00 GB"}, "dm-3": {"scheduler_mode": "", "rotational": "1", "vendor": null, "sectors": "6291456", "links": {"masters": [], "labels": ["homelv"], "ids": ["dm-name-rootvg-home", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3arM0HTNGEpU0MEFfo6QmG4Nl4v18f97l"], "uuids": ["9864bb7c-ba12-4b1d-878e-d89017a91edb"]}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": null, "partitions": {}, "holders": [], "size": "3.00 GB"}, "dm-0": {"scheduler_mode": "", "rotational": "1", "vendor": null, "sectors": "12582912", "links": {"masters": [], "labels": ["usrlv"], "ids": ["dm-name-rootvg-usr", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s3Df3rN5A6h6obvkPqzn6hsgqD3Ti0bAnz"], "uuids": ["abd30de1-b50b-4a90-babe-502491022aac"]}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": null, "partitions": {}, "holders": [], "size": "6.00 GB"}, "dm-1": {"scheduler_mode": "", "rotational": "1", "vendor": null, "sectors": "8388608", "links": {"masters": [], "labels": ["rootlv"], "ids": ["dm-name-rootvg-root", "dm-uuid-LVM-wIR3fAmez3vA4EFkLpEwsvfAp6jeC7s39S8BbbeX5lPkKxNBfFl9CRZGqaXHfmol"], "uuids": ["1ff70062-11f6-4341-947a-44d31bf499d3"]}, "sas_device_handle": null, "sas_address": null, "virtual": 1, "host": "", "sectorsize": "512", "removable": "0", "support_discard": "0", "model": null, "partitions": {}, "holders": [], "size": "4.00 GB"}}, "ansible_user_uid": 1012, "ansible_bios_date": "12/12/2018", "ansible_system_capabilities": [""]}}\r\n', b'Shared connection to 10.15.13.148 closed.\r\n')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'rm -f -r /tmp/ansible-tmp-1706859745.3966923-110886-2346024750462/ > /dev/null 2>&1 && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
ok: [ANT3CASAPPS01]
META: ran handlers

TASK [IBPS-deployment : Download zip from GitHub packages on Runner] ***********
task path: /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/roles/IBPS-deployment/tasks/main.yml:1
<localhost> ESTABLISH LOCAL CONNECTION FOR USER: itdevtra
<localhost> EXEC /bin/sh -c '( umask 77 && mkdir -p "` echo /tmp `"&& mkdir /tmp/ansible-tmp-1706859753.7769194-110900-223602723451467 && echo ansible-tmp-1706859753.7769194-110900-223602723451467="` echo /tmp/ansible-tmp-1706859753.7769194-110900-223602723451467 `" ) && sleep 0'
Using module file /usr/lib/python3.6/site-packages/ansible/modules/net_tools/basics/get_url.py
<localhost> PUT /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmpxygq0n4s TO /tmp/ansible-tmp-1706859753.7769194-110900-223602723451467/AnsiballZ_get_url.py
<localhost> EXEC /bin/sh -c 'chmod u+x /tmp/ansible-tmp-1706859753.7769194-110900-223602723451467/ /tmp/ansible-tmp-1706859753.7769194-110900-223602723451467/AnsiballZ_get_url.py && sleep 0'
<localhost> EXEC /bin/sh -c '/usr/libexec/platform-python /tmp/ansible-tmp-1706859753.7769194-110900-223602723451467/AnsiballZ_get_url.py && sleep 0'
<localhost> EXEC /bin/sh -c 'rm -f -r /tmp/ansible-tmp-1706859753.7769194-110900-223602723451467/ > /dev/null 2>&1 && sleep 0'
changed: [ANT3CASAPPS01 -> localhost] => {
    "changed": true,
    "checksum_dest": null,
    "checksum_src": "c4e54c36979610eb573e72da06f1808c73ba5969",
    "dest": "/tmp/release-1.0.0.2.zip",
    "elapsed": 4,
    "gid": 1009,
    "group": "itdevtra",
    "invocation": {
        "module_args": {
            "attributes": null,
            "backup": null,
            "checksum": "",
            "client_cert": null,
            "client_key": null,
            "content": null,
            "delimiter": null,
            "dest": "/tmp/release-1.0.0.2.zip",
            "directory_mode": null,
            "follow": false,
            "force": false,
            "force_basic_auth": false,
            "group": null,
            "headers": {
                "Authorization": "token ***"
            },
            "http_agent": "ansible-httpget",
            "mode": null,
            "owner": null,
            "path": "/tmp/release-1.0.0.2.zip",
            "regexp": null,
            "remote_src": null,
            "selevel": null,
            "serole": null,
            "setype": null,
            "seuser": null,
            "sha256sum": "",
            "src": null,
            "timeout": 10,
            "tmp_dest": null,
            "unsafe_writes": null,
            "url": "https://maven.pkg.github.com/rakbank-internal/ibps-was-ansible-cd/Rak/IBPS/release/1.0.0.2/release-1.0.0.2.zip",
            "url_password": null,
            "url_username": null,
            "use_proxy": true,
            "validate_certs": true
        }
    },
    "md5sum": "d5b4fc40834f343fd8a90baa76ffe837",
    "mode": "0664",
    "msg": "OK (2221725 bytes)",
    "owner": "itdevtra",
    "size": 2221725,
    "src": "/tmp/ansible-tmp-1706859753.7769194-110900-223602723451467/tmpn_ll_vr0",
    "state": "file",
    "status_code": 200,
    "uid": 1008,
    "url": "https://maven.pkg.github.com/rakbank-internal/ibps-was-ansible-cd/Rak/IBPS/release/1.0.0.2/release-1.0.0.2.zip"
}

TASK [IBPS-deployment : Copy zip to Target Server] *****************************
task path: /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/roles/IBPS-deployment/tasks/main.yml:10
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'( umask 77 && mkdir -p "` echo /tmp `"&& mkdir /tmp/ansible-tmp-1706859758.97715-110926-102229203246780 && echo ansible-tmp-1706859758.97715-110926-102229203246780="` echo /tmp/ansible-tmp-1706859758.97715-110926-102229203246780 `" ) && sleep 0'"'"''
<10.15.13.148> (0, b'ansible-tmp-1706859758.97715-110926-102229203246780=/tmp/ansible-tmp-1706859758.97715-110926-102229203246780\n', b'')
Using module file /usr/lib/python3.6/site-packages/ansible/modules/files/stat.py
<10.15.13.148> PUT /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmpr1q662ul TO /tmp/ansible-tmp-1706859758.97715-110926-102229203246780/AnsiballZ_stat.py
<10.15.13.148> SSH: EXEC sftp -b - -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a '[10.15.13.148]'
<10.15.13.148> (0, b'sftp> put /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmpr1q662ul /tmp/ansible-tmp-1706859758.97715-110926-102229203246780/AnsiballZ_stat.py\n', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'chmod u+x /tmp/ansible-tmp-1706859758.97715-110926-102229203246780/ /tmp/ansible-tmp-1706859758.97715-110926-102229203246780/AnsiballZ_stat.py && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a -tt 10.15.13.148 '/bin/sh -c '"'"'/usr/bin/python /tmp/ansible-tmp-1706859758.97715-110926-102229203246780/AnsiballZ_stat.py && sleep 0'"'"''
<10.15.13.148> (0, b'\r\n{"invocation": {"module_args": {"checksum_algorithm": "sha1", "get_checksum": true, "follow": false, "path": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release-1.0.0.2.zip", "get_md5": null, "get_mime": true, "get_attributes": true}}, "stat": {"charset": "binary", "uid": 1012, "exists": true, "attr_flags": "", "woth": false, "isreg": true, "device_type": 0, "mtime": 1706697604.190408, "block_size": 4096, "inode": 1189196, "isgid": false, "size": 2221725, "executable": true, "isuid": false, "readable": true, "version": "18446744071929709553", "pw_name": "itdevtra", "gid": 1013, "ischr": false, "wusr": true, "writeable": true, "mimetype": "application/zip", "blocks": 4352, "xoth": true, "islnk": false, "nlink": 1, "issock": false, "rgrp": true, "gr_name": "itdevtra", "path": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release-1.0.0.2.zip", "xusr": true, "atime": 1706792460.810263, "isdir": false, "ctime": 1706697604.6364126, "isblk": false, "wgrp": false, "checksum": "c4e54c36979610eb573e72da06f1808c73ba5969", "dev": 64779, "roth": true, "isfifo": false, "mode": "0755", "xgrp": true, "rusr": true, "attributes": []}, "changed": false}\r\n', b'Shared connection to 10.15.13.148 closed.\r\n')
Using module file /usr/lib/python3.6/site-packages/ansible/modules/files/file.py
<10.15.13.148> PUT /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmpihvyn9_l TO /tmp/ansible-tmp-1706859758.97715-110926-102229203246780/AnsiballZ_file.py
<10.15.13.148> SSH: EXEC sftp -b - -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a '[10.15.13.148]'
<10.15.13.148> (0, b'sftp> put /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmpihvyn9_l /tmp/ansible-tmp-1706859758.97715-110926-102229203246780/AnsiballZ_file.py\n', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'chmod u+x /tmp/ansible-tmp-1706859758.97715-110926-102229203246780/ /tmp/ansible-tmp-1706859758.97715-110926-102229203246780/AnsiballZ_file.py && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a -tt 10.15.13.148 '/bin/sh -c '"'"'/usr/bin/python /tmp/ansible-tmp-1706859758.97715-110926-102229203246780/AnsiballZ_file.py && sleep 0'"'"''
<10.15.13.148> (0, b'\r\n{"group": "itdevtra", "uid": 1012, "changed": false, "owner": "itdevtra", "state": "file", "gid": 1013, "mode": "0755", "path": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release-1.0.0.2.zip", "invocation": {"module_args": {"directory_mode": null, "force": false, "remote_src": null, "_original_basename": "release-1.0.0.2.zip", "path": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release-1.0.0.2.zip", "owner": null, "follow": true, "group": null, "unsafe_writes": null, "setype": null, "content": null, "serole": null, "access_time": null, "state": "file", "dest": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release-1.0.0.2.zip", "selevel": null, "access_time_format": "%Y%m%d%H%M.%S", "modification_time": null, "regexp": null, "src": null, "seuser": null, "recurse": false, "_diff_peek": null, "delimiter": null, "mode": "0755", "modification_time_format": "%Y%m%d%H%M.%S", "attributes": null, "backup": null}}, "diff": {"after": {"path": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release-1.0.0.2.zip"}, "before": {"path": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release-1.0.0.2.zip"}}, "size": 2221725}\r\n', b'Shared connection to 10.15.13.148 closed.\r\n')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'rm -f -r /tmp/ansible-tmp-1706859758.97715-110926-102229203246780/ > /dev/null 2>&1 && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
ok: [ANT3CASAPPS01] => {
    "changed": false,
    "checksum": "c4e54c36979610eb573e72da06f1808c73ba5969",
    "dest": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release-1.0.0.2.zip",
    "diff": {
        "after": {
            "path": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release-1.0.0.2.zip"
        },
        "before": {
            "path": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release-1.0.0.2.zip"
        }
    },
    "gid": 1013,
    "group": "itdevtra",
    "invocation": {
        "module_args": {
            "_diff_peek": null,
            "_original_basename": "release-1.0.0.2.zip",
            "access_time": null,
            "access_time_format": "%Y%m%d%H%M.%S",
            "attributes": null,
            "backup": null,
            "content": null,
            "delimiter": null,
            "dest": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release-1.0.0.2.zip",
            "directory_mode": null,
            "follow": true,
            "force": false,
            "group": null,
            "mode": "0755",
            "modification_time": null,
            "modification_time_format": "%Y%m%d%H%M.%S",
            "owner": null,
            "path": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release-1.0.0.2.zip",
            "recurse": false,
            "regexp": null,
            "remote_src": null,
            "selevel": null,
            "serole": null,
            "setype": null,
            "seuser": null,
            "src": null,
            "state": "file",
            "unsafe_writes": null
        }
    },
    "mode": "0755",
    "owner": "itdevtra",
    "path": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release-1.0.0.2.zip",
    "size": 2221725,
    "state": "file",
    "uid": 1012
}

TASK [IBPS-deployment : Copy deploy.sh to Target Server] ***********************
task path: /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/roles/IBPS-deployment/tasks/main.yml:16
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'( umask 77 && mkdir -p "` echo /tmp `"&& mkdir /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069 && echo ansible-tmp-1706859760.5835168-110938-125377582967069="` echo /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069 `" ) && sleep 0'"'"''
<10.15.13.148> (0, b'ansible-tmp-1706859760.5835168-110938-125377582967069=/tmp/ansible-tmp-1706859760.5835168-110938-125377582967069\n', b'')
Using module file /usr/lib/python3.6/site-packages/ansible/modules/files/stat.py
<10.15.13.148> PUT /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmpeju4jlsv TO /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/AnsiballZ_stat.py
<10.15.13.148> SSH: EXEC sftp -b - -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a '[10.15.13.148]'
<10.15.13.148> (0, b'sftp> put /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmpeju4jlsv /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/AnsiballZ_stat.py\n', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'chmod u+x /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/ /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/AnsiballZ_stat.py && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a -tt 10.15.13.148 '/bin/sh -c '"'"'/usr/bin/python /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/AnsiballZ_stat.py && sleep 0'"'"''
<10.15.13.148> (0, b'\r\n{"invocation": {"module_args": {"checksum_algorithm": "sha1", "get_checksum": true, "follow": false, "path": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/deploy.sh", "get_md5": null, "get_mime": true, "get_attributes": true}}, "stat": {"charset": "us-ascii", "uid": 1012, "exists": true, "attr_flags": "", "woth": false, "isreg": true, "device_type": 0, "mtime": 1706859785.396069, "block_size": 4096, "inode": 1189234, "isgid": false, "size": 378, "executable": true, "isuid": false, "readable": true, "version": "18446744071929711254", "pw_name": "itdevtra", "gid": 1013, "ischr": false, "wusr": true, "writeable": true, "mimetype": "text/x-shellscript", "blocks": 8, "xoth": true, "islnk": false, "nlink": 1, "issock": false, "rgrp": true, "gr_name": "itdevtra", "path": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/deploy.sh", "xusr": true, "atime": 1706859787.269081, "isdir": false, "ctime": 1706859785.8580723, "isblk": false, "wgrp": false, "checksum": "0ee139370a5f5b21ada75e5728a3f4cf4b7f1682", "dev": 64779, "roth": true, "isfifo": false, "mode": "0755", "xgrp": true, "rusr": true, "attributes": []}, "changed": false}\r\n', b'Shared connection to 10.15.13.148 closed.\r\n')
<10.15.13.148> PUT /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/deploy.sh TO /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/source
<10.15.13.148> SSH: EXEC sftp -b - -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a '[10.15.13.148]'
<10.15.13.148> (0, b'sftp> put /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/deploy.sh /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/source\n', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'chmod u+x /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/ /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/source && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
Using module file /usr/lib/python3.6/site-packages/ansible/modules/files/copy.py
<10.15.13.148> PUT /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmp1j88_y0a TO /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/AnsiballZ_copy.py
<10.15.13.148> SSH: EXEC sftp -b - -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a '[10.15.13.148]'
<10.15.13.148> (0, b'sftp> put /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmp1j88_y0a /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/AnsiballZ_copy.py\n', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'chmod u+x /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/ /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/AnsiballZ_copy.py && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a -tt 10.15.13.148 '/bin/sh -c '"'"'/usr/bin/python /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/AnsiballZ_copy.py && sleep 0'"'"''
<10.15.13.148> (0, b'\r\n{"src": "/tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/source", "changed": true, "group": "itdevtra", "uid": 1012, "dest": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/deploy.sh", "checksum": "3dc83d929b67ff18486ce203e683a80b24ce3430", "md5sum": "53d1b26f6bb98ae262ed9218c323e6ff", "owner": "itdevtra", "state": "file", "gid": 1013, "mode": "0755", "invocation": {"module_args": {"directory_mode": null, "force": true, "remote_src": null, "_original_basename": "deploy.sh", "owner": null, "follow": false, "local_follow": null, "group": null, "unsafe_writes": null, "setype": null, "content": null, "serole": null, "dest": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/deploy.sh", "selevel": null, "regexp": null, "validate": null, "src": "/tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/source", "checksum": "3dc83d929b67ff18486ce203e683a80b24ce3430", "seuser": null, "delimiter": null, "mode": "0755", "attributes": null, "backup": false}}, "size": 2404}\r\n', b'Shared connection to 10.15.13.148 closed.\r\n')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'rm -f -r /tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/ > /dev/null 2>&1 && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
changed: [ANT3CASAPPS01] => {
    "changed": true,
    "checksum": "3dc83d929b67ff18486ce203e683a80b24ce3430",
    "dest": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/deploy.sh",
    "diff": [],
    "gid": 1013,
    "group": "itdevtra",
    "invocation": {
        "module_args": {
            "_original_basename": "deploy.sh",
            "attributes": null,
            "backup": false,
            "checksum": "3dc83d929b67ff18486ce203e683a80b24ce3430",
            "content": null,
            "delimiter": null,
            "dest": "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/deploy.sh",
            "directory_mode": null,
            "follow": false,
            "force": true,
            "group": null,
            "local_follow": null,
            "mode": "0755",
            "owner": null,
            "regexp": null,
            "remote_src": null,
            "selevel": null,
            "serole": null,
            "setype": null,
            "seuser": null,
            "src": "/tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/source",
            "unsafe_writes": null,
            "validate": null
        }
    },
    "md5sum": "53d1b26f6bb98ae262ed9218c323e6ff",
    "mode": "0755",
    "owner": "itdevtra",
    "size": 2404,
    "src": "/tmp/ansible-tmp-1706859760.5835168-110938-125377582967069/source",
    "state": "file",
    "uid": 1012
}

TASK [IBPS-deployment : Run deploy on Target Server] ***************************
task path: /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/roles/IBPS-deployment/tasks/main.yml:24
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'( umask 77 && mkdir -p "` echo /tmp `"&& mkdir /tmp/ansible-tmp-1706859762.0992484-110955-225496179926597 && echo ansible-tmp-1706859762.0992484-110955-225496179926597="` echo /tmp/ansible-tmp-1706859762.0992484-110955-225496179926597 `" ) && sleep 0'"'"''
<10.15.13.148> (0, b'ansible-tmp-1706859762.0992484-110955-225496179926597=/tmp/ansible-tmp-1706859762.0992484-110955-225496179926597\n', b'')
Using module file /usr/lib/python3.6/site-packages/ansible/modules/commands/command.py
<10.15.13.148> PUT /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmp09xdxcgk TO /tmp/ansible-tmp-1706859762.0992484-110955-225496179926597/AnsiballZ_command.py
<10.15.13.148> SSH: EXEC sftp -b - -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a '[10.15.13.148]'
<10.15.13.148> (0, b'sftp> put /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmp09xdxcgk /tmp/ansible-tmp-1706859762.0992484-110955-225496179926597/AnsiballZ_command.py\n', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'chmod u+x /tmp/ansible-tmp-1706859762.0992484-110955-225496179926597/ /tmp/ansible-tmp-1706859762.0992484-110955-225496179926597/AnsiballZ_command.py && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a -tt 10.15.13.148 '/bin/sh -c '"'"'/usr/bin/python /tmp/ansible-tmp-1706859762.0992484-110955-225496179926597/AnsiballZ_command.py && sleep 0'"'"''
<10.15.13.148> (0, b'\r\n{"changed": true, "end": "2024-02-02 11:43:50.371284", "stdout": "total 36\\ndrwxrwxr-x 6 itdevtra itdevtra  4096 Feb  2 11:43 .\\ndrwxrwxrwx 6 root     root     12288 Feb  2 11:43 ..\\ndrwxrwxr-x 3 itdevtra itdevtra  4096 Jan 31 14:15 newgenapp_jar.ear\\ndrwxrwxr-x 3 itdevtra itdevtra  4096 Jan 31 14:15 ofme_ejb.ear\\ndrwxrwxr-x 3 itdevtra itdevtra  4096 Jan 31 14:15 omniapp_ejb.ear\\n-rw-rw-r-- 1 itdevtra itdevtra   413 Jan 31 14:30 release.txt\\n-rw-rw-r-- 1 itdevtra itdevtra     0 Jan 31 14:30 rollback.txt\\ndrwxrwxr-x 3 itdevtra itdevtra  4096 Jan 31 14:15 WFS.ear\\ntotal 1420\\ndrwxrwxr-x 3 itdevtra itdevtra    4096 Jan 31 14:15 .\\ndrwxrwxr-x 6 itdevtra itdevtra    4096 Feb  2 11:43 ..\\ndrwxrwxr-x 2 itdevtra itdevtra    4096 Jan 31 14:15 META-INF\\n-rw-rw-r-- 1 itdevtra itdevtra 1434683 May 29  2019 wfs_ejb.jar\\nnewgenapp_jar.ear,/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\\r\\nofme_ejb.ear,/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\\r\\nomniapp_ejb.ear,/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\\r\\nWFS.ear,/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\\nCopy: newgenapp_jar.ear - /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release/newgenapp_jar.ear -> //ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\\r\\nCopy: ofme_ejb.ear - /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release/ofme_ejb.ear -> //ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\\r\\nCopy: omniapp_ejb.ear - /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release/omniapp_ejb.ear -> //ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\\r\\nCopy: WFS.ear - /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release/WFS.ear -> //ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell", "cmd": "cd /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin && ./deploy.sh /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin https://maven.pkg.github.com/rakbank-internal/ibps-was-ansible-cd/Rak/IBPS/release/1.0.0.2/release-1.0.0.2.zip release-1.0.0.2.zip /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/backup", "rc": 0, "start": "2024-02-02 11:43:49.990322", "stderr": "cp: cannot create regular file \\u2018//ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell/WFS.ear/META-INF/application.xml\\u2019: Permission denied\\ncp: cannot create regular file \\u2018//ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell/WFS.ear/META-INF/ibm-application-bnd.xmi\\u2019: Permission denied\\ncp: cannot create regular file \\u2018//ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell/WFS.ear/META-INF/MANIFEST.MF\\u2019: Permission denied\\ncp: cannot create regular file \\u2018//ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell/WFS.ear/wfs_ejb.jar\\u2019: Permission denied", "delta": "0:00:00.380962", "invocation": {"module_args": {"creates": null, "executable": null, "_uses_shell": true, "strip_empty_ends": true, "_raw_params": "cd /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin && ./deploy.sh /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin https://maven.pkg.github.com/rakbank-internal/ibps-was-ansible-cd/Rak/IBPS/release/1.0.0.2/release-1.0.0.2.zip release-1.0.0.2.zip /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/backup", "removes": null, "argv": null, "warn": false, "chdir": null, "stdin_add_newline": true, "stdin": null}}}\r\n', b'Shared connection to 10.15.13.148 closed.\r\n')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'rm -f -r /tmp/ansible-tmp-1706859762.0992484-110955-225496179926597/ > /dev/null 2>&1 && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
changed: [ANT3CASAPPS01] => {
    "changed": true,
    "cmd": "cd /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin && ./deploy.sh /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin https://maven.pkg.github.com/rakbank-internal/ibps-was-ansible-cd/Rak/IBPS/release/1.0.0.2/release-1.0.0.2.zip release-1.0.0.2.zip /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/backup",
    "delta": "0:00:00.380962",
    "end": "2024-02-02 11:43:50.371284",
    "invocation": {
        "module_args": {
            "_raw_params": "cd /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin && ./deploy.sh /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin https://maven.pkg.github.com/rakbank-internal/ibps-was-ansible-cd/Rak/IBPS/release/1.0.0.2/release-1.0.0.2.zip release-1.0.0.2.zip /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/backup",
            "_uses_shell": true,
            "argv": null,
            "chdir": null,
            "creates": null,
            "executable": null,
            "removes": null,
            "stdin": null,
            "stdin_add_newline": true,
            "strip_empty_ends": true,
            "warn": false
        }
    },
    "rc": 0,
    "start": "2024-02-02 11:43:49.990322",
    "stderr": "cp: cannot create regular file ‘//ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell/WFS.ear/META-INF/application.xml’: Permission denied\ncp: cannot create regular file ‘//ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell/WFS.ear/META-INF/ibm-application-bnd.xmi’: Permission denied\ncp: cannot create regular file ‘//ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell/WFS.ear/META-INF/MANIFEST.MF’: Permission denied\ncp: cannot create regular file ‘//ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell/WFS.ear/wfs_ejb.jar’: Permission denied",
    "stderr_lines": [
        "cp: cannot create regular file ‘//ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell/WFS.ear/META-INF/application.xml’: Permission denied",
        "cp: cannot create regular file ‘//ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell/WFS.ear/META-INF/ibm-application-bnd.xmi’: Permission denied",
        "cp: cannot create regular file ‘//ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell/WFS.ear/META-INF/MANIFEST.MF’: Permission denied",
        "cp: cannot create regular file ‘//ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell/WFS.ear/wfs_ejb.jar’: Permission denied"
    ],
    "stdout": "total 36\ndrwxrwxr-x 6 itdevtra itdevtra  4096 Feb  2 11:43 .\ndrwxrwxrwx 6 root     root     12288 Feb  2 11:43 ..\ndrwxrwxr-x 3 itdevtra itdevtra  4096 Jan 31 14:15 newgenapp_jar.ear\ndrwxrwxr-x 3 itdevtra itdevtra  4096 Jan 31 14:15 ofme_ejb.ear\ndrwxrwxr-x 3 itdevtra itdevtra  4096 Jan 31 14:15 omniapp_ejb.ear\n-rw-rw-r-- 1 itdevtra itdevtra   413 Jan 31 14:30 release.txt\n-rw-rw-r-- 1 itdevtra itdevtra     0 Jan 31 14:30 rollback.txt\ndrwxrwxr-x 3 itdevtra itdevtra  4096 Jan 31 14:15 WFS.ear\ntotal 1420\ndrwxrwxr-x 3 itdevtra itdevtra    4096 Jan 31 14:15 .\ndrwxrwxr-x 6 itdevtra itdevtra    4096 Feb  2 11:43 ..\ndrwxrwxr-x 2 itdevtra itdevtra    4096 Jan 31 14:15 META-INF\n-rw-rw-r-- 1 itdevtra itdevtra 1434683 May 29  2019 wfs_ejb.jar\nnewgenapp_jar.ear,/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\r\nofme_ejb.ear,/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\r\nomniapp_ejb.ear,/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\r\nWFS.ear,/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\nCopy: newgenapp_jar.ear - /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release/newgenapp_jar.ear -> //ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\r\nCopy: ofme_ejb.ear - /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release/ofme_ejb.ear -> //ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\r\nCopy: omniapp_ejb.ear - /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release/omniapp_ejb.ear -> //ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\r\nCopy: WFS.ear - /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release/WFS.ear -> //ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell",
    "stdout_lines": [
        "total 36",
        "drwxrwxr-x 6 itdevtra itdevtra  4096 Feb  2 11:43 .",
        "drwxrwxrwx 6 root     root     12288 Feb  2 11:43 ..",
        "drwxrwxr-x 3 itdevtra itdevtra  4096 Jan 31 14:15 newgenapp_jar.ear",
        "drwxrwxr-x 3 itdevtra itdevtra  4096 Jan 31 14:15 ofme_ejb.ear",
        "drwxrwxr-x 3 itdevtra itdevtra  4096 Jan 31 14:15 omniapp_ejb.ear",
        "-rw-rw-r-- 1 itdevtra itdevtra   413 Jan 31 14:30 release.txt",
        "-rw-rw-r-- 1 itdevtra itdevtra     0 Jan 31 14:30 rollback.txt",
        "drwxrwxr-x 3 itdevtra itdevtra  4096 Jan 31 14:15 WFS.ear",
        "total 1420",
        "drwxrwxr-x 3 itdevtra itdevtra    4096 Jan 31 14:15 .",
        "drwxrwxr-x 6 itdevtra itdevtra    4096 Feb  2 11:43 ..",
        "drwxrwxr-x 2 itdevtra itdevtra    4096 Jan 31 14:15 META-INF",
        "-rw-rw-r-- 1 itdevtra itdevtra 1434683 May 29  2019 wfs_ejb.jar",
        "newgenapp_jar.ear,/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell",
        "ofme_ejb.ear,/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell",
        "omniapp_ejb.ear,/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell",
        "WFS.ear,/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell",
        "Copy: newgenapp_jar.ear - /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release/newgenapp_jar.ear -> //ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell",
        "Copy: ofme_ejb.ear - /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release/ofme_ejb.ear -> //ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell",
        "Copy: omniapp_ejb.ear - /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release/omniapp_ejb.ear -> //ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell",
        "Copy: WFS.ear - /ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/bin/release/WFS.ear -> //ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell"
    ]
}

TASK [IBPS-deployment : List contents of the directory after copying deploy.sh] ***
task path: /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/roles/IBPS-deployment/tasks/main.yml:31
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'( umask 77 && mkdir -p "` echo /tmp `"&& mkdir /tmp/ansible-tmp-1706859763.0277386-110964-17967169703911 && echo ansible-tmp-1706859763.0277386-110964-17967169703911="` echo /tmp/ansible-tmp-1706859763.0277386-110964-17967169703911 `" ) && sleep 0'"'"''
<10.15.13.148> (0, b'ansible-tmp-1706859763.0277386-110964-17967169703911=/tmp/ansible-tmp-1706859763.0277386-110964-17967169703911\n', b'')
Using module file /usr/lib/python3.6/site-packages/ansible/modules/commands/command.py
<10.15.13.148> PUT /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmpdu788wyc TO /tmp/ansible-tmp-1706859763.0277386-110964-17967169703911/AnsiballZ_command.py
<10.15.13.148> SSH: EXEC sftp -b - -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a '[10.15.13.148]'
<10.15.13.148> (0, b'sftp> put /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmpdu788wyc /tmp/ansible-tmp-1706859763.0277386-110964-17967169703911/AnsiballZ_command.py\n', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'chmod u+x /tmp/ansible-tmp-1706859763.0277386-110964-17967169703911/ /tmp/ansible-tmp-1706859763.0277386-110964-17967169703911/AnsiballZ_command.py && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a -tt 10.15.13.148 '/bin/sh -c '"'"'/usr/bin/python /tmp/ansible-tmp-1706859763.0277386-110964-17967169703911/AnsiballZ_command.py && sleep 0'"'"''
<10.15.13.148> (0, b'\r\n{"changed": true, "end": "2024-02-02 11:43:51.072482", "stdout": "total 12\\ndrwxrwxr-x  3 itdevtra itdevtra 4096 Jan 13 12:43 .\\ndrwxrwxrwx 93 root     root     4096 Jan 13 12:43 ..\\ndrwxrwxr-x  3 itdevtra itdevtra 4096 Jan 13 12:43 i", "cmd": ["ls", "-al", "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/backup"], "rc": 0, "start": "2024-02-02 11:43:50.735460", "stderr": "", "delta": "0:00:00.337022", "invocation": {"module_args": {"creates": null, "executable": null, "_uses_shell": false, "strip_empty_ends": true, "_raw_params": "ls -al \\"/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/backup\\"", "removes": null, "argv": null, "warn": false, "chdir": null, "stdin_add_newline": true, "stdin": null}}}\r\n', b'Shared connection to 10.15.13.148 closed.\r\n')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'rm -f -r /tmp/ansible-tmp-1706859763.0277386-110964-17967169703911/ > /dev/null 2>&1 && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
changed: [ANT3CASAPPS01] => {
    "changed": true,
    "cmd": [
        "ls",
        "-al",
        "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/backup"
    ],
    "delta": "0:00:00.337022",
    "end": "2024-02-02 11:43:51.072482",
    "invocation": {
        "module_args": {
            "_raw_params": "ls -al \"/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/backup\"",
            "_uses_shell": false,
            "argv": null,
            "chdir": null,
            "creates": null,
            "executable": null,
            "removes": null,
            "stdin": null,
            "stdin_add_newline": true,
            "strip_empty_ends": true,
            "warn": false
        }
    },
    "rc": 0,
    "start": "2024-02-02 11:43:50.735460",
    "stderr": "",
    "stderr_lines": [],
    "stdout": "total 12\ndrwxrwxr-x  3 itdevtra itdevtra 4096 Jan 13 12:43 .\ndrwxrwxrwx 93 root     root     4096 Jan 13 12:43 ..\ndrwxrwxr-x  3 itdevtra itdevtra 4096 Jan 13 12:43 i",
    "stdout_lines": [
        "total 12",
        "drwxrwxr-x  3 itdevtra itdevtra 4096 Jan 13 12:43 .",
        "drwxrwxrwx 93 root     root     4096 Jan 13 12:43 ..",
        "drwxrwxr-x  3 itdevtra itdevtra 4096 Jan 13 12:43 i"
    ]
}

TASK [IBPS-deployment : List contents of the directory after copying deploy.sh] ***
task path: /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/roles/IBPS-deployment/tasks/main.yml:36
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'( umask 77 && mkdir -p "` echo /tmp `"&& mkdir /tmp/ansible-tmp-1706859763.7257843-110972-142226999766872 && echo ansible-tmp-1706859763.7257843-110972-142226999766872="` echo /tmp/ansible-tmp-1706859763.7257843-110972-142226999766872 `" ) && sleep 0'"'"''
<10.15.13.148> (0, b'ansible-tmp-1706859763.7257843-110972-142226999766872=/tmp/ansible-tmp-1706859763.7257843-110972-142226999766872\n', b'')
Using module file /usr/lib/python3.6/site-packages/ansible/modules/commands/command.py
<10.15.13.148> PUT /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmp5uaj56wb TO /tmp/ansible-tmp-1706859763.7257843-110972-142226999766872/AnsiballZ_command.py
<10.15.13.148> SSH: EXEC sftp -b - -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a '[10.15.13.148]'
<10.15.13.148> (0, b'sftp> put /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmp5uaj56wb /tmp/ansible-tmp-1706859763.7257843-110972-142226999766872/AnsiballZ_command.py\n', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'chmod u+x /tmp/ansible-tmp-1706859763.7257843-110972-142226999766872/ /tmp/ansible-tmp-1706859763.7257843-110972-142226999766872/AnsiballZ_command.py && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a -tt 10.15.13.148 '/bin/sh -c '"'"'/usr/bin/python /tmp/ansible-tmp-1706859763.7257843-110972-142226999766872/AnsiballZ_command.py && sleep 0'"'"''
<10.15.13.148> (0, b'\r\n{"changed": true, "end": "2024-02-02 11:43:51.755232", "stdout": "total 144\\ndrwxrwxrwx 36 root root 4096 Dec 25  2019 .\\ndrwxrwxrwx  7 root root 4096 Feb  1 13:54 ..\\ndrwxrwxrwx  4 root root 4096 Sep 21  2017 axis2.ear\\ndrwxr-xr-x  4 root root 4096 May 15  2019 bam.ear\\ndrwxr-xr-x  4 root root 4096 May 15  2019 brms.ear\\ndrwxr-xr-x  4 root root 4096 May 16  2019 chat.ear\\ndrwxr-xr-x  3 root root 4096 May 16  2019 classificator_ejb.ear\\ndrwxr-xr-x  3 root root 4096 Jul 12  2019 classificator_ejb_HF28.ear\\ndrwxrwxrwx  5 root root 4096 Feb  9  2017 DefaultApplication.ear\\ndrwxr-xr-x  4 root root 4096 May 17  2019 formviewer.ear\\ndrwxr-xr-x  4 root root 4096 May 17  2019 iforms.ear\\ndrwxrwxrwx  4 root root 4096 Feb  9  2017 ivtApp.ear\\ndrwxr-xr-x  4 root root 4096 May 17  2019 mdm.ear\\ndrwxr-xr-x  4 root root 4096 Jul 12  2019 mdm_HF28.ear\\ndrwxrwxrwx  3 root root 4096 May 29  2017 newgenapp_jar.ear\\ndrwxr-xr-x  3 root root 4096 May 17  2019 ofme_ejb.ear\\ndrwxr-xr-x  4 root root 4096 May 16  2019 ofservices.ear\\ndrwxr-xr-x  4 root root 4096 May 16  2019 omniapp.ear\\ndrwxr-xr-x  3 root root 4096 May 16  2019 omniapp_ejb.ear\\ndrwxr-xr-x  3 root root 4096 May 14  2019 omnidocs_ejb.ear\\ndrwxr-xr-x  4 root root 4096 May 14  2019 omnidocs_war.ear\\ndrwxr-xr-x  4 root root 4096 May 17  2019 omniforms.ear\\ndrwxr-xr-x  3 root root 4096 May 17  2019 omnirules_ejb.ear\\ndrwxr-xr-x  4 root root 4096 May 14  2019 OpAll_war.ear\\ndrwxr-xr-x  4 root root 4096 May 17  2019 orm.ear\\ndrwxr-xr-x  4 root root 4096 May 17  2019 otms.ear\\ndrwxr-xr-x  4 root root 4096 Jun 10  2019 pmweb.ear\\ndrwxr-xr-x  3 root root 4096 May 17  2019 pmweb_ejb.ear\\ndrwxrwxrwx  3 root root 4096 Feb  9  2017 query.ear\\ndrwxr-xr-x  3 root root 4096 May 17  2019 reportingsolution_ejb.ear\\ndrwxr-xr-x  4 root root 4096 Jun 27  2018 test_war.ear\\ndrwxr-xr-x  3 root root 4096 May 17  2019 TimerServiceBean.ear\\ndrwxr-xr-x  4 root root 4096 Dec 25  2019 webdesktop.ear\\ndrwxr-xr-x  3 root root 4096 Feb 21  2019 wfcustom_ejb_jar1.ear\\ndrwxr-xr-x  3 root root 4096 Dec 12  2019 wfcustom_ejb_jar.ear\\ndrwxr-xr-x  3 root root 4096 May 29  2019 WFS.ear", "cmd": ["ls", "-al", "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell"], "rc": 0, "start": "2024-02-02 11:43:51.439735", "stderr": "", "delta": "0:00:00.315497", "invocation": {"module_args": {"creates": null, "executable": null, "_uses_shell": false, "strip_empty_ends": true, "_raw_params": "ls -al \\"/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\\"", "removes": null, "argv": null, "warn": false, "chdir": null, "stdin_add_newline": true, "stdin": null}}}\r\n', b'Shared connection to 10.15.13.148 closed.\r\n')
<10.15.13.148> ESTABLISH SSH CONNECTION FOR USER: itdevtra
<10.15.13.148> SSH: EXEC ssh -C -o ControlMaster=auto -o ControlPersist=60s -o StrictHostKeyChecking=no -o Port=22 -o KbdInteractiveAuthentication=no -o PreferredAuthentications=gssapi-with-mic,gssapi-keyex,hostbased,publickey -o PasswordAuthentication=no -o 'User="itdevtra"' -o ConnectTimeout=30 -o ControlPath=/home/itdevtra/.ansible/cp/2b6c10444a 10.15.13.148 '/bin/sh -c '"'"'rm -f -r /tmp/ansible-tmp-1706859763.7257843-110972-142226999766872/ > /dev/null 2>&1 && sleep 0'"'"''
<10.15.13.148> (0, b'', b'')
changed: [ANT3CASAPPS01] => {
    "changed": true,
    "cmd": [
        "ls",
        "-al",
        "/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell"
    ],
    "delta": "0:00:00.315497",
    "end": "2024-02-02 11:43:51.755232",
    "invocation": {
        "module_args": {
            "_raw_params": "ls -al \"/ibm/IBM-CAS/WebSphere/AppServer/profiles/AppSrv01/installedApps/ANT2CASAPPS01Node01Cell\"",
            "_uses_shell": false,
            "argv": null,
            "chdir": null,
            "creates": null,
            "executable": null,
            "removes": null,
            "stdin": null,
            "stdin_add_newline": true,
            "strip_empty_ends": true,
            "warn": false
        }
    },
    "rc": 0,
    "start": "2024-02-02 11:43:51.439735",
    "stderr": "",
    "stderr_lines": [],
    "stdout": "total 144\ndrwxrwxrwx 36 root root 4096 Dec 25  2019 .\ndrwxrwxrwx  7 root root 4096 Feb  1 13:54 ..\ndrwxrwxrwx  4 root root 4096 Sep 21  2017 axis2.ear\ndrwxr-xr-x  4 root root 4096 May 15  2019 bam.ear\ndrwxr-xr-x  4 root root 4096 May 15  2019 brms.ear\ndrwxr-xr-x  4 root root 4096 May 16  2019 chat.ear\ndrwxr-xr-x  3 root root 4096 May 16  2019 classificator_ejb.ear\ndrwxr-xr-x  3 root root 4096 Jul 12  2019 classificator_ejb_HF28.ear\ndrwxrwxrwx  5 root root 4096 Feb  9  2017 DefaultApplication.ear\ndrwxr-xr-x  4 root root 4096 May 17  2019 formviewer.ear\ndrwxr-xr-x  4 root root 4096 May 17  2019 iforms.ear\ndrwxrwxrwx  4 root root 4096 Feb  9  2017 ivtApp.ear\ndrwxr-xr-x  4 root root 4096 May 17  2019 mdm.ear\ndrwxr-xr-x  4 root root 4096 Jul 12  2019 mdm_HF28.ear\ndrwxrwxrwx  3 root root 4096 May 29  2017 newgenapp_jar.ear\ndrwxr-xr-x  3 root root 4096 May 17  2019 ofme_ejb.ear\ndrwxr-xr-x  4 root root 4096 May 16  2019 ofservices.ear\ndrwxr-xr-x  4 root root 4096 May 16  2019 omniapp.ear\ndrwxr-xr-x  3 root root 4096 May 16  2019 omniapp_ejb.ear\ndrwxr-xr-x  3 root root 4096 May 14  2019 omnidocs_ejb.ear\ndrwxr-xr-x  4 root root 4096 May 14  2019 omnidocs_war.ear\ndrwxr-xr-x  4 root root 4096 May 17  2019 omniforms.ear\ndrwxr-xr-x  3 root root 4096 May 17  2019 omnirules_ejb.ear\ndrwxr-xr-x  4 root root 4096 May 14  2019 OpAll_war.ear\ndrwxr-xr-x  4 root root 4096 May 17  2019 orm.ear\ndrwxr-xr-x  4 root root 4096 May 17  2019 otms.ear\ndrwxr-xr-x  4 root root 4096 Jun 10  2019 pmweb.ear\ndrwxr-xr-x  3 root root 4096 May 17  2019 pmweb_ejb.ear\ndrwxrwxrwx  3 root root 4096 Feb  9  2017 query.ear\ndrwxr-xr-x  3 root root 4096 May 17  2019 reportingsolution_ejb.ear\ndrwxr-xr-x  4 root root 4096 Jun 27  2018 test_war.ear\ndrwxr-xr-x  3 root root 4096 May 17  2019 TimerServiceBean.ear\ndrwxr-xr-x  4 root root 4096 Dec 25  2019 webdesktop.ear\ndrwxr-xr-x  3 root root 4096 Feb 21  2019 wfcustom_ejb_jar1.ear\ndrwxr-xr-x  3 root root 4096 Dec 12  2019 wfcustom_ejb_jar.ear\ndrwxr-xr-x  3 root root 4096 May 29  2019 WFS.ear",
    "stdout_lines": [
        "total 144",
        "drwxrwxrwx 36 root root 4096 Dec 25  2019 .",
        "drwxrwxrwx  7 root root 4096 Feb  1 13:54 ..",
        "drwxrwxrwx  4 root root 4096 Sep 21  2017 axis2.ear",
        "drwxr-xr-x  4 root root 4096 May 15  2019 bam.ear",
        "drwxr-xr-x  4 root root 4096 May 15  2019 brms.ear",
        "drwxr-xr-x  4 root root 4096 May 16  2019 chat.ear",
        "drwxr-xr-x  3 root root 4096 May 16  2019 classificator_ejb.ear",
        "drwxr-xr-x  3 root root 4096 Jul 12  2019 classificator_ejb_HF28.ear",
        "drwxrwxrwx  5 root root 4096 Feb  9  2017 DefaultApplication.ear",
        "drwxr-xr-x  4 root root 4096 May 17  2019 formviewer.ear",
        "drwxr-xr-x  4 root root 4096 May 17  2019 iforms.ear",
        "drwxrwxrwx  4 root root 4096 Feb  9  2017 ivtApp.ear",
        "drwxr-xr-x  4 root root 4096 May 17  2019 mdm.ear",
        "drwxr-xr-x  4 root root 4096 Jul 12  2019 mdm_HF28.ear",
        "drwxrwxrwx  3 root root 4096 May 29  2017 newgenapp_jar.ear",
        "drwxr-xr-x  3 root root 4096 May 17  2019 ofme_ejb.ear",
        "drwxr-xr-x  4 root root 4096 May 16  2019 ofservices.ear",
        "drwxr-xr-x  4 root root 4096 May 16  2019 omniapp.ear",
        "drwxr-xr-x  3 root root 4096 May 16  2019 omniapp_ejb.ear",
        "drwxr-xr-x  3 root root 4096 May 14  2019 omnidocs_ejb.ear",
        "drwxr-xr-x  4 root root 4096 May 14  2019 omnidocs_war.ear",
        "drwxr-xr-x  4 root root 4096 May 17  2019 omniforms.ear",
        "drwxr-xr-x  3 root root 4096 May 17  2019 omnirules_ejb.ear",
        "drwxr-xr-x  4 root root 4096 May 14  2019 OpAll_war.ear",
        "drwxr-xr-x  4 root root 4096 May 17  2019 orm.ear",
        "drwxr-xr-x  4 root root 4096 May 17  2019 otms.ear",
        "drwxr-xr-x  4 root root 4096 Jun 10  2019 pmweb.ear",
        "drwxr-xr-x  3 root root 4096 May 17  2019 pmweb_ejb.ear",
        "drwxrwxrwx  3 root root 4096 Feb  9  2017 query.ear",
        "drwxr-xr-x  3 root root 4096 May 17  2019 reportingsolution_ejb.ear",
        "drwxr-xr-x  4 root root 4096 Jun 27  2018 test_war.ear",
        "drwxr-xr-x  3 root root 4096 May 17  2019 TimerServiceBean.ear",
        "drwxr-xr-x  4 root root 4096 Dec 25  2019 webdesktop.ear",
        "drwxr-xr-x  3 root root 4096 Feb 21  2019 wfcustom_ejb_jar1.ear",
        "drwxr-xr-x  3 root root 4096 Dec 12  2019 wfcustom_ejb_jar.ear",
        "drwxr-xr-x  3 root root 4096 May 29  2019 WFS.ear"
    ]
}

TASK [IBPS-deployment : Clean up zip file from Runner] *************************
task path: /ansible/GITHUB_RUNNER/actions-runner10/_work/ibps-was-ansible-cd/ibps-was-ansible-cd/roles/IBPS-deployment/tasks/main.yml:41
<localhost> ESTABLISH LOCAL CONNECTION FOR USER: itdevtra
<localhost> EXEC /bin/sh -c '( umask 77 && mkdir -p "` echo /tmp `"&& mkdir /tmp/ansible-tmp-1706859764.4070022-110981-145192251728268 && echo ansible-tmp-1706859764.4070022-110981-145192251728268="` echo /tmp/ansible-tmp-1706859764.4070022-110981-145192251728268 `" ) && sleep 0'
Using module file /usr/lib/python3.6/site-packages/ansible/modules/files/file.py
<localhost> PUT /home/itdevtra/.ansible/tmp/ansible-local-110878088ie231/tmp0py439mh TO /tmp/ansible-tmp-1706859764.4070022-110981-145192251728268/AnsiballZ_file.py
<localhost> EXEC /bin/sh -c 'chmod u+x /tmp/ansible-tmp-1706859764.4070022-110981-145192251728268/ /tmp/ansible-tmp-1706859764.4070022-110981-145192251728268/AnsiballZ_file.py && sleep 0'
<localhost> EXEC /bin/sh -c '/usr/libexec/platform-python /tmp/ansible-tmp-1706859764.4070022-110981-145192251728268/AnsiballZ_file.py && sleep 0'
<localhost> EXEC /bin/sh -c 'rm -f -r /tmp/ansible-tmp-1706859764.4070022-110981-145192251728268/ > /dev/null 2>&1 && sleep 0'
changed: [ANT3CASAPPS01 -> localhost] => {
    "changed": true,
    "diff": {
        "after": {
            "path": "/tmp/release-1.0.0.2.zip",
            "state": "absent"
        },
        "before": {
            "path": "/tmp/release-1.0.0.2.zip",
            "state": "file"
        }
    },
    "invocation": {
        "module_args": {
            "_diff_peek": null,
            "_original_basename": null,
            "access_time": null,
            "access_time_format": "%Y%m%d%H%M.%S",
            "attributes": null,
            "backup": null,
            "content": null,
            "delimiter": null,
            "directory_mode": null,
            "follow": true,
            "force": false,
            "group": null,
            "mode": null,
            "modification_time": null,
            "modification_time_format": "%Y%m%d%H%M.%S",
            "owner": null,
            "path": "/tmp/release-1.0.0.2.zip",
            "recurse": false,
            "regexp": null,
            "remote_src": null,
            "selevel": null,
            "serole": null,
            "setype": null,
            "seuser": null,
            "src": null,
            "state": "absent",
            "unsafe_writes": null
        }
    },
    "path": "/tmp/release-1.0.0.2.zip",
    "state": "absent"
}
META: ran handlers
META: ran handlers

PLAY RECAP *********************************************************************
ANT3CASAPPS01              : ok=8    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
