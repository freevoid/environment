#!/bin/sh

# setup xrandr if and only if VGA1 output is connected
xrandr -q | grep "VGA1 connected" && xrandr --output VGA1 --auto --above DP1
#--rotate left

#force dialog to add passphrase in chain
ssh-add

# mount remote home dir: developer vm
#sshfs desh.dev.tools.yandex.net:/home/desh/ $HOME/dev_remote

