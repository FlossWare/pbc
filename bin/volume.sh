#!/bin/bash 

#
# This file is part of the FlossWare family of open source software.
#
# FlossWare is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.:w
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
#

#
# Utility script to deal with volumes
#

# -----------------------------------------------------------------------------------

. `dirname ${BASH_SOURCE[0]}`/common.sh

# -----------------------------------------------------------------------------------

#
# Add a host to the partition definitions...
#
add-host() {
    echo
}

#
# Delete a host from the partition definitions...
#
delete-host() {
    echo
}

#
# List hosts use in partition definitions...
#
list-hosts() {
    echo

    echo "------------------------------------------"
    echo "Volume Hosts"
    echo "------------------------------------------"

    for aHost in ${VOLUME_HOME}/*
    do
        echo "`basename ${aHost}`:"

        for aVolume in `cat ${aHost}`
        do
            echo "    ${aVolume}"
        done
    done

    echo
}

#
# Add a partition to a VM...
#
add-partition() {
    echo

    echo "------------------------------------------"
    echo "Add Volume"
    echo "------------------------------------------"

    echo -n "Host:  "
    read host
    echo -n "Dir:   "
    read dir

    mkdir -p ${VOLUME_HOME}/${host}

    sudo mount ${host}/${dir} ${VOLUME_HOME}/${host}
}

#
# Remove a parition from a VM...
#
remove-partition() {
    echo
}

#
# Delete a defined partitions...
#
delete-partition() {
    echo
}

#
# List all partitions...
#
list-partitions() {
    echo
}

#
# Print help
#
help() {
    echo
    echo "Bad choice!"
    echo
}

#
# Choose an operation
#
operation() {
    echo -n "Choice:  "

    read operation
    echo

    case "${operation}" in
        a)
            add-host
            ;;
        d)
            delete-host
            ;;
        l)
            list-hosts
            ;;
        e)
            exit 0
            ;;
        *)
            help
            ;;
    esac
}

#
# Print the menu
#
menu() {
    echo
    echo "------------------------------------------"
    echo "Volume Management"
    echo "------------------------------------------"
    echo
    echo "Operations:"
    echo "    a)  Add host to volume definitions."
    echo "    r)  Remove host from volume definitions (will not remove any VMs using those volumes)."
    echo "    l)  List hosts included in volumes."
    echo 
    echo "    e) Exit"
    echo

    operation
}

#
# Main
#
while [ true ]
do
    menu
done