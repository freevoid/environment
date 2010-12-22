.PHONY: makeconf git vim git-prompt scripts

common: vim git bash scripts

all: vim git bash scripts gentoo

scripts:
	cp -r HOME/bin/* ${HOME}/bin/

bash: git-prompt
	cp HOME/.bash* ${HOME}/
	
git-prompt:
	cp HOME/.git-prompt.sh ${HOME}/
	cp HOME/.config/git-prompt.conf ${HOME}/.config/

vim:
	cp -r HOME/.vimrc HOME/.vim ${HOME}/

git:
	cp HOME/.gitconfig $(HOME)/

gentoo: makeconf
	
makeconf:
	cp misc/make.conf /etc/

