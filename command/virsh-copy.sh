#!/bin/bash

# Assume $1 is the directory name from which we are being run

hosts=`dirname $1`/../host
name=`basename $1`
extends=`cat $1/extends`

for aHost in $hosts/*
do
    host=`basename ${aHost}`
    realHost=`cat ${aHost}`

    echo
    echo "============================================================================"
    echo "Defining [${name} extends ${extends}] on [${realHost}] -> [${host}]"
    echo "============================================================================"
    echo

    ssh root@${realHost} virt-clone --original ${extends} --name ${name} --auto-clone

    ssh root@${realHost} virt-sysprep -d ${name} --hostname ${name}

    if [ -e $1/vcpu ]
    then
        echo "    setting vCPUs to [`cat $1/vcpu`]"

        ssh root@${realHost} virsh setvcpus --count `cat $1/vcpu`
    fi

    if [ -e $1/memory ]
    then
        echo "    Setting max memory to [`cat $1/disk`]"

        ssh root@${realHost} virsh setmaxmem --size `cat $1/memory`
    fi

    if [ -e $1/disk ]
    then
        echo "   Resizing disk [`cat $1/disk`]"

        imgFile=/var/lib/libvirt/images/${name}.*

        ssh root@${realHost} qemu-img resize ${imgFile} `cat $1/disk`
    fi
done