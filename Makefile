.PHONY: makeconf git vim git-prompt scripts

common: vim git bash scripts

rich: common texmf X

full: rich gentoo

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

texmf:
	mkdir -p $(HOME)/texmf/
	cp -r HOME/texmf/* $(HOME)/texmf/
	mktexlsr $(HOME)/texmf

gentoo: makeconf
	
makeconf:
	cp misc/make.conf /etc/

X:
	cp HOME/.Xresources ${HOME}/

