all: vim git

vim:
	cp -r HOME/.vimrc HOME/.vim ${HOME}/

git:
	cp HOME/.gitconfig $(HOME)/

