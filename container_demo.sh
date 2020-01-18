#!/usr/bin/env bash

# Demo first part - create chroot environment - stuff bash and top into it.

##### PREP #####

CHROOT=/tmp/chroot
CHROOTLIB=$CHROOT/lib64
CHROOTBIN=$CHROOT/bin

mkdir -p $CHROOTLIB
mkdir -p $CHROOTBIN

# Binaries for demo

cp /usr/bin/bash $CHROOTBIN
cp /usr/bin/top $CHROOTBIN

# Libraries

MYLIBRARIES=`ldd /usr/bin/top /usr/bin/bash | grep "=>" | awk '{print $3}' | sort -u`

for THISLIB in `echo $MYLIBRARIES`
   do
   	cp $THISLIB $CHROOTLIB/
   done

# Demo second part - namespaces
# first lets start up a basic PID namespace

sudo unshare --fork --pid --mount-proc bash

# Execute top - show only 'bash' and 'top' running

# cgroup - create a small namespace with only 8 mb ram

# show ram before 

# show ram inside of namespace
