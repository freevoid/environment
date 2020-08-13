# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# source variable definitions / exports
if [ -f ~/.bash_def ] ; then
    . ~/.bash_def
fi

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"



# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# Stopping CTRL-S/CTRL-Q stuff
stty ixoff -ixon

# PATH tweaking

if [ -d "$HOME/lib/python" ] ; then
    export PYTHONPATH="$HOME/lib/python:$PYTHONPATH"
fi

if [ -d "$HOME/workspace" ] ; then
    export PYTHONPATH="$HOME/workspace:$PYTHONPATH"
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [-d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# including local file to source environment-specific stuff
if [ -f ~/.bash_local ] ; then
    . ~/.bash_local
fi

export PATH=$PATH

# Start fish shell if available
if [ ! -f ~/.bash_fish_off ] ; then
    WHICH_FISH=$(which fish)
    if echo $- | grep -q 'i' && [[ -x $WHICH_FISH ]] && [[ $SHELL != "$WHICH_FISH" ]]; then
    # Safeguard to only activate fish for interactive shells and only if fish
    # shell is present and executable. Verify that this is a new session by
    # checking if $SHELL is set to the path to fish. If it is not, we set
    # $SHELL and start fish.
    #
    # If this is not a new session, the user probably typed 'bash' into their
    # console and wants bash, so we skip this.
    exec env SHELL="$WHICH_FISH" "$WHICH_FISH" -i
    fi
else
    BASE16_SHELL=$HOME/.config/base16-shell/
    [ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$($BASE16_SHELL/profile_helper.sh)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
