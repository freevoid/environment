all: vim git bash

bash: git-prompt
	cp HOME/.bash* ${HOME}/
	
git-prompt:
	cp HOME/.git-prompt.sh ${HOME}/
	cp HOME/.config/git-prompt.conf ${HOME}/.config/

vim:
	cp -r HOME/.vimrc HOME/.vim ${HOME}/

git:
	cp HOME/.gitconfig $(HOME)/

