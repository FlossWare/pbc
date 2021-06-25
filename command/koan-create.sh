#!/bin/bash -e

# Assume $1 is the directory name from which we are being run

hosts=`dirname $1`/../host
name=`basename $1`
server=`cat $1/server`
system=`cat $1/system`

for aHost in $hosts/*
do
    host=`basename ${aHost}`
    realHost=`cat ${aHost}`

    echo
    echo "============================================================================"
    echo "Defining [${name}] on [${host}] -> [${realHost}]"
    echo "============================================================================"
    echo

    ssh root@${realHost} koan --server=${server} --system=${system} --virt --virt-name=${name}

    echo
    echo "============================================================================"
    echo "Waiting for ${name} to provision..."
    echo "============================================================================"
    echo

    ssh -t root@${realHost} virsh console ${name}
done