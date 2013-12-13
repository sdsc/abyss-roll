# SDSC "abyss" roll

## Overview

This Rocks roll bundles the ABySS sequence assembler package.

ABySS is a de novo, parallel, paired-end sequence assembler that is designed for short reads. The single-processor version is useful for assembling genomes up to 100 Mbases in size. The parallel version is implemented using MPI and is capable of assembling larger genomes.

For more information about ABySS please visit the <a href="http://www.bcgsc.ca/platform/bioinfo/software/abyss" target="_blank">official web page</a>.

## Requirements

To build/install this roll you must have root access to a Rocks development machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must download the appropriate R source file(s) using a machine that does have Internet access and copy them into the `src/abyss` directory on your Rocks development machine.


## Dependencies

Unknown at this time.

## Building

To build the abyss-roll, execute these instructions on a Rocks development machine (e.g., a frontend or development appliance):

```shell
% make default 2>&1 | tee build.log
% grep "RPM build error" build.log
```

If nothing is returned from the grep command then the roll should have been created as... `abyss-*.iso`. If you built the roll on a Rocks frontend then proceed to the installation step. If you built the roll on a Rocks development appliance you need to copy the roll to your Rocks frontend before continuing with installation.

This roll source supports building for different network fabrics and mpi
flavors.  By default, it builds using the gnu compilers for openmpi ethernet.
To build for a different configuration, use the ROLLMPI and ROLLNETWORK make
variables, e.g.:

```shell
% make ROLLMPI=mvapich2 ROLLNETWORK=ib 
```

The build process currently supports ROLLMPI values "openmpi", "mpich2", and
"mvapich2", defaulting to "openmpi".  It uses any ROLLNETWORK variable value(s)
to load appropriate mpi modules, assuming that there are modules named
$(ROLLMPI)_$(ROLLNETWORK) available (e.g., openmpi_ib, mpich2_mx, etc.).


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll abyss
% cd /export/rocks/install
% rocks create distro
% rocks run roll abyss | bash
```

In addition to the software itself, the roll installs ABYSS environment module
files in:

```
/opt/modulefiles/applications/abyss
```


## Testing

The abyss-roll includes a test script which can be run to verify proper installation of the abyss-roll documentation, binaries and module files. To run the test scripts execute the following command(s):

```shell
% /root/rolltests/abyss.t 
ok 1 - abyss is installed
ok 2 - abyss test run
ok 3 - abyss module installed
ok 4 - abyss version module installed
ok 5 - abyss version module link created
1..5
```

