#extract the rpm file
rpm2cpio xen-device-model-0.10.2.xs-3.0.0.x86_64.rpm|cpio -idmv
yes |cp -f ./usr/libexec/xen/bin/qemu-dm /usr/libexec/xen/bin/qemu-dm
yes |cp -f ./usr/lib64/xen/bin/qemu-dm ./usr/lib64/xen/bin/qemu-dm


#remove the current debug build
rpm -qa |grep xen-device-model-debug |xargs rpm -e
find xen-device-model-debug* |xargs rpm -ivh
