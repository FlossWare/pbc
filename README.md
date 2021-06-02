# Po' Boy Cloud
This project stems from a desire to have OpenStack/RHEV capabilities in a simple form with less requirements.  It is not meant to be enterprise class.  Instead it's to provide similar VM-like capabilities.

How did we arrive at the name `Po' Boy Cloud`?  Similar to offerings in some grocery stores where one can purchase a [po' boy sub](https://www.delightedcooking.com/what-is-a-poboy-sandwich.htm), this project aims for a similar every man's cloud.

## Concepts
We prefer keyless [ssh](https://en.wikipedia.org/wiki/Secure_Shell) to interact with hosts.

### Volumes
Volumes represent locations where VMs are defined and/or `disks` can be added to running VMs.  The only requirement is those locations be accessible via NFS.  Please note, volumes may also exist on Compute Nodes.

Configuration is `${HOME}/.flossware/pbc/volume`

### Compute Nodes
Compute nodes are simply bare metal machines running [KVM](https://en.wikipedia.org/wiki/Kernel-based_Virtual_Machine) and accessible via [ssh](https://en.wikipedia.org/wiki/Secure_Shell).

### Virtual Machines

#### Creating

##### Net New
Virtual machines can be created:
* [KOAN](https://koan.readthedocs.io/en/latest/koan.html) for a net new instance or to define flavors (see the [Flavors]((https://github.com/FlossWare/pbc#flavors) section for more information).
* [virt-install](https://linux.die.net/man/1/virt-install)

##### Flavor
Using predefined virtual machines definitions known as `flavors` and is nothing more than a predefined virtual machine stored as a `template` that has defined:
* vCPUs
* Disk
* Memory

Flavors are built/defined using the functionality denoted in the [Net New](https://github.com/FlossWare/pbc#net-new) section.

## Setup

### Configuration

The following represent configuration directories:
* `${HOME}/.FlossWare/pbc`:  [pbc]((https://github.com/FlossWare/pbc) configuration root.
* `${HOME}/.FlossWare/pbc/compute:`  all compute node definitions.
* `${HOME}/.FlossWare/pbc/flavor`:  all flavor definitions.
* `${HOME}/.FlossWare/pbc/partition`:  all partition definitions.
* `${HOME}/.FlossWare/pbc/volume`:  all volume definitions.

To start using [pbc](https://github.com/FlossWare/pbc), run the [setup.sh]() script first.  All configuration will be stored in `${HOME}/.FlossWare/pbc` directory.  This script will all you to defined [NFS](https://en.wikipedia.org/wiki/Network_File_System) hosts for [volumes](https://github.com/FlossWare/pbc#volumes) and [compute nodes](https://github.com/FlossWare/pbc#compute-nodes).