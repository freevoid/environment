.PHONY: makeconf git vim git-prompt scripts

BASH_CONFIGS=$(patsubst HOME/%, ${HOME}/%, $(wildcard HOME/.bash*))

${HOME}/.%: HOME/.%
	cp $< $@

common: vim git bash scripts

rich: common texmf X

full: rich gentoo

scripts:
	cp -r HOME/bin/* ${HOME}/bin/

bash: git-prompt $(BASH_CONFIGS)
	
git-prompt: ${HOME}/.git-prompt.sh
	cp HOME/.config/git-prompt.conf ${HOME}/.config/

vim:
	cd HOME; find .vim/ ! -regex ".*/\.git.*" ! -type d | xargs -l1 -iARG cp --parents -P ARG ${HOME}/

git: $(HOME)/.gitconfig

texmf:
	mkdir -p $(HOME)/texmf/
	cp -r HOME/texmf/* $(HOME)/texmf/
	mktexlsr $(HOME)/texmf

gentoo: makeconf
	
makeconf:
	cp misc/make.conf /etc/
	
X:	$(HOME)/.Xresources
	xrdb -merge $<

