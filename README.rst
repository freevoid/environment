General info
============

This project holds various dotfiles, small scripts/snippets and, as major part, vim config that I use everyday.

On a brand new machine I usualy need only few commands to get the environment ready::

    mkdir -p ~/src && cd ~/src
    git clone git://github.com/freevoid/environment.git
    cd environment
    sudo apt-get install `cat requirements.txt`
    make common

One can read Makefile to see what "make common" actually do. "vim" target is actually only linux-compatible at the moment due to some crazy "find" command, but I know that you can handle that by yourself. After "make common" you **MUST** fix email/name in ~/.gitconfig and ~/.bash_personal. Maybe someday I'll remove such info from the public repository, but now I just don't care.
