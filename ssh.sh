#!/bin/sh
TARGET=$1
mkdir $TARGET/root/.ssh
chmod 0700 $TARGET/root/.ssh
wget --quiet -O - https://le9i0nx.github.io/debian-autoinstall/authorized_keys >> $TARGET/root/.ssh/authorized_keys
chmod 0600 $TARGET/root/.ssh/authorized_keys
