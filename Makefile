.PHONY: scripts texmf X

BASH_CONFIGS=$(patsubst HOME/%, ${HOME}/%, $(wildcard HOME/.bash*))

DOTCONFIG_PATH=${HOME}/.config
FISH_DIR=${DOTCONFIG_PATH}/fish
BASE16_SHELL_PATH=${DOTCONFIG_PATH}/base16-shell

${HOME}/.%: HOME/.%
	cp -r $< ${HOME}

common: vim bash fish tmux scripts

full: common texmf X

~/bin/:
	mkdir -p ${HOME}/bin/

scripts: ${HOME}/bin
	cp -r HOME/bin/* ${HOME}/bin/

bash: $(BASH_CONFIGS)

${BASE16_SHELL_PATH}:
	git clone --depth 1 https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

tmux: powerline tpm ${HOME}/.tmux.conf

tpm: ~/.tmux/plugins/tpm

~/.tmux/plugins/tpm:
	git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

base16: ${BASE16_SHELL_PATH}
	cd ${BASE16_SHELL_PATH}
	git pull

powerline: ~/.local/bin/powerline
~/.local/bin/powerline:
	pip install --user --upgrade powerline-status

vim: powerline vimplug vimrc

vimrc: ${HOME}/.vimrc

~/.vimrc: HOME/.vimrc
	cp HOME/.vimrc ${HOME}/

vimplug: ${HOME}/.vim/autoload/plug.vim

~/.vim/autoload/plug.vim:
	curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

~/bin/nvim: ${HOME}/bin/nvim.appimage
	ln -s ${HOME}/bin/nvim.appimage ${HOME}/bin/nvi
	ln -s ${HOME}/bin/nvim.appimage ${HOME}/bin/nvim
~/bin/nvim.appimage: ${HOME}/bin/
	curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o ${HOME}/bin/nvim.appimage
	chmod u+x ${HOME}/bin/nvim.appimage
nvim_linux: ${HOME}/bin/nvim nvim
nvim: vim ${HOME}/.config/nvim

${HOME}/.config/nvim:
	ln -s ${HOME}/.vim ${HOME}/.config/nvim
	ln -sf ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim

texmf:
	mkdir -p ${HOME}/texmf/
	cp -r HOME/texmf/* ${HOME}/texmf/
	mktexlsr ${HOME}/texmf

X:	${HOME}/.Xdefaults
	xrdb -merge $<

# Fish shell related
${FISH_DIR}:
	mkdir -p ${FISH_DIR}
${FISH_DIR}/functions/fisher.fish:
	curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs \
		https://git.io/fisher
${FISH_DIR}/config.fish: HOME/.config/fish/config.fish ${FISH_DIR}
	cp -r $< ${FISH_DIR}/config.fish
${FISH_DIR}/conf.d: HOME/.config/fish/conf.d ${FISH_DIR}
	cp -r $< ${FISH_DIR}/
fisherman: ${FISH_DIR}/functions/fisher.fish
	fish -c "fisher z"
	fish -c "fisher oh-my-fish/theme-bobthefish"

fish: base16 ${FISH_DIR}/config.fish ${FISH_DIR}/conf.d fisherman
