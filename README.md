# Po' Boy Cloud
This project stems from a desire to have OpenStack/RHEV capabilities in a simple form with less requirements.  It is not meant to be enterprise class.  Instead it's to provide similar VM-like capabilities.

How did we arrive at the name `Po' Boy Cloud`?  Similar to offerings in some grocery stores where one can purchase a `po' boy sub`, this project aims for a similar every man's cloud.

## Concepts
We utilize keyless [ssh]() to interact with hosts.

### Volumes
Volumes represent locations where VMs are defined and/or "disks" can be added to running VMs.  The only requirement is those locations be accessible via NFS.  Please note, volumes may also exist on Compute Nodes.

Configuration is `${HOME}/.flossware/pbc/volume`

### Compute Nodes
Compute nodes are simply bare metal machines running [KVM]() and accessible via [ssh]().

### Virtual Machines

#### Creating

##### Net New
Virtual machines can be created:
* [KOAN](https://koan.readthedocs.io/en/latest/koan.html) for a net new instance or to define flavors (see the [Flavors]() section for more information).
* [virt-install](https://linux.die.net/man/1/virt-install)

##### Flavor
Using predefined virtual machines definitions known as `flavors` and is nothing more than a predefined virtual machine stored as a `template` that has defined:
* vCPUs
* Disk
* Memory

Flavors are built/defined using the functionality denoted in the [Net New]() section.

## Setup

### Configuration
To start using [pbc](https://github.com/FlossWare/pbc), run the [setup.sh]() script first.  All configuration will be stored in `${HOME}/.FlossWare/pbc` directory.  This script will all you to defined [NFS]() hosts for [volumes]() and [compute nodes]().