.PHONY: makeconf git vim git-prompt scripts submodules

BASH_CONFIGS=$(patsubst HOME/%, ${HOME}/%, $(wildcard HOME/.bash*))

${HOME}/.%: HOME/.%
	cp -r $< ${HOME}

common: vim git bash scripts

rich: common texmf X

full: rich gentoo

scripts:
	mkdir -p ${HOME}/bin/
	cp -r HOME/bin/* ${HOME}/bin/

bash: git-prompt $(BASH_CONFIGS)

git-prompt: ${HOME}/.git-prompt.sh
	mkdir -p ${HOME}/.config/
	cp HOME/.config/git-prompt.conf ${HOME}/.config/

vim: submodules ropevim
	cd HOME; find .vim/ ! -regex ".*/\.git.*" ! -type d | xargs -l1 -iARG cp --parents -P ARG ${HOME}/
	cp HOME/.vimrc ${HOME}/

ropevim: ${HOME}/lib/python/ropevim.py

${HOME}/lib/python/ropevim.py: HOME/lib/python/ropevim.py
	mkdir -p ${HOME}/lib/python/
	cp $< $@

submodules:
	git submodule init
	git submodule update

git: $(HOME)/.gitconfig

texmf:
	mkdir -p $(HOME)/texmf/
	cp -r HOME/texmf/* $(HOME)/texmf/
	mktexlsr $(HOME)/texmf

gentoo: makeconf

makeconf:
	cp misc/make.conf /etc/

X:	$(HOME)/.Xdefaults
	xrdb -merge $<

