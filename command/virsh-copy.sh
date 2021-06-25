#!/bin/bash

# Assume $1 is the directory name from which we are being run

virt-clone --original `cat $1/extends` --name $1 --auto-clone

virt-sysprep -d $1 --hostname $1

if [ -e $1/vcpu ]
then
    "Echo setting vCPUs to [`cat $1/vcpu`]"

    virsh setvcpus `cat $1/vcpu`
fi

if [ -e $1/memory ]
then
    virsh setmaxmem `cat $1/memory`
fi

if [ -e $1/disk ]
then
    echo "Setting max memory to [`cat $1/disk`]"

    qemu-img resize /var/lib/libvirt/images/$1.* `cat $1/disk`
fi