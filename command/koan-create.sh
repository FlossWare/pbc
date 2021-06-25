#!/bin/bash

# Assume $1 is the directory name from which we are being run

koan --server=`cat $1/cobbler` --system=$1 --virt

if [ -e $1/vcpu ]
then
    echo "Setting vCPUs to [`cat $1/vcpu`]"

    virsh setvcpus `cat $1/vcpu`
fi

if [ -e $1/memory ]
then
    echo "Setting max memory to [`cat $1/memory`]"

    virsh setmaxmem `cat $1/memory`
fi
