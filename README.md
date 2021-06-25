# Po' Boy Cloud
This project stems from a desire to have OpenStack/RHEV capabilities in a simple form with less requirements and is not meant to be enterprise class.  Instead it's to provide similar VM-like capabilities.

How did we arrive at the name `Po' Boy Cloud`?  Similar to offerings in some grocery stores where one can purchase a [po' boy sub](https://www.delightedcooking.com/what-is-a-poboy-sandwich.htm), this project aims for a similar every man's cloud.

## Definitions
* Compute Nodes:  bare metal machines that run virtual machines.
* Virtual Machine:  full OS
* Stack:  Collection of virtual machines and/or stacks.
* Keyless [SSH](https://en.wikipedia.org/wiki/Secure_Shell) to interact with Compute Nodes.

### Concepts

#### Lifecycle

Logically, virtual machines and stacks have similar lifecycle operations.  However, each vary in what they do:

* `create.sh`
* `remove.sh`
* `provision.sh`
* `destroy.sh`
* `start.sh`
* `stop.sh`
* `templatize.sh`
* `waitTillAvailable.sh`

#### VM Lifecycle

Scripts defined for a VM will define the aforementioned scripts in terms of t

* `create.sh`:  script to create a virtual machine.  Example:  `koan` or `virt-install`.
* `remove.sh`:  script to remove a virtual machine.
* `provision.sh`:  script to provision a running virtual machine.
* `destroy.sh`:  s
* `start.sh`
* `stop.sh`
* `templatize.sh`
* `waitTillAvailable.sh`

#### Stack Lifecycle

* `create.sh`:  script to create a complete stack.
* `remove.sh`
* `provision.sh`
* `destroy.sh`
* `start.sh`
* `stop.sh`
* `templatize.sh`
* `waitTillAvailable.sh`


#### Templates
Templates are predefined `virtual machines` or `stack` definitions as defined below.

##### Common
Stacks and virtual machines all utilize a set of lifecycle scripts as defined above.

##### VM Templates
Define a:
* vCPUs:  total number of virtual CPUs for the VM.  Defined in a file entitled `vcpu`
* Disk:  disk size for the VM.  Defined in a file entitled `disk`
* Memory:  amount of memory for the VM.  Defined in a file entitled `memory`.
* Host:  the name of the host to run the virtual machine on.  Defined in a file entitled `host`.  _This is optional._

##### Stack Templates
Define:
* VMs:  one can override any settings from a VM template.  Each VM to be used will defined in a directory that is named after a VM template.
* Stacks:  can override any definitions from a stack template.  Each stack to be used will be defined in a directory that is namved after a Stack template.

### Storage

#### Volumes
Volumes represent locations where VMs are defined for running VMs.  The only requirement is those locations be accessible via NFS.  Please note, volumes may also exist on [compute nodes](https://github.com/FlossWare/pbc#compute-nodes).

Configuration is `${HOME}/.flossware/pbc/volumes`

#### Partitions
Partitions represent locations where `disks` can be added to running VMs.  The only requirement is those locations be accessible via NFS.  Please note, partitions may also exist on [compute nodes](https://github.com/FlossWare/pbc#compute-nodes).

Configuration is `${HOME}/.flossware/pbc/partitions`

## Setup

### Configuration

The following represent configuration directories:
* `${HOME}/.FlossWare/pbc`:  [pbc]((https://github.com/FlossWare/pbc) configuration `home`.
* `${HOME}/.FlossWare/pbc/definition:`  contains all lifecycle and template definitions.
* `${HOME}/.FlossWare/pbc/definition/lifecycle:`  contains all lifecycle definitions.
* `${HOME}/.FlossWare/pbc/definition/template:`  contains all virtual machine and stack definitions.

To start using [pbc](https://github.com/FlossWare/pbc), run the [setup.sh]() script first.  All configuration will be stored in `${HOME}/.FlossWare/pbc` directory.  This script will all you to define [NFS](https://en.wikipedia.org/wiki/Network_File_System) hosts for [volumes](https://github.com/FlossWare/pbc#volumes) and [compute nodes](https://github.com/FlossWare/pbc#compute-nodes).

### Virtual Machines

#### Defining

#### Creating

##### Net New
Virtual machines can be created using:
* [KOAN](https://koan.readthedocs.io/en/latest/koan.html) for a net new instance or to define flavors (see the [Flavors](https://github.com/FlossWare/pbc#flavors) section for more information).
* [virt-install](https://linux.die.net/man/1/virt-install)

##### Flavor
Flavors are built/defined using the functionality denoted in the [Net New](https://github.com/FlossWare/pbc#net-new) section.