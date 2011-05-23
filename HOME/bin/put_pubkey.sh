#!/bin/bash
ssh $1 "mkdir -p ~/.ssh"
scp $HOME/.ssh/authorized_keys $1:~/.ssh/authorized_keys
