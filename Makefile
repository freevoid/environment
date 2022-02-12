.PHONY: scripts texmf X bash common full fish tmux tpm vim vimrc vimplug nvim nvim_linux base16 base16_update fisher_update fisher

BASH_CONFIGS=$(patsubst HOME/%, ${HOME}/%, $(wildcard HOME/.bash*))
SCRIPTS=$(patsubst HOME/%, ${HOME}/%, $(wildcard HOME/bin/*))

DOTCONFIG_PATH=${HOME}/.config
FISH_DIR=${DOTCONFIG_PATH}/fish
BASE16_SHELL_PATH=${DOTCONFIG_PATH}/base16-shell

common: nvim bash fish tmux scripts

full: common texmf X

${HOME}/bin:
	mkdir -p "${HOME}/bin/"

${HOME}/bin/%: HOME/bin/% | ${HOME}/bin
	cp -r "$<" "$@"

scripts: $(SCRIPTS)

bash: $(BASH_CONFIGS)

${BASE16_SHELL_PATH}:
	git clone --depth 1 https://github.com/chriskempson/base16-shell.git "${DOTCONFIG_PATH}/base16-shell"

tmux: powerline tpm ${HOME}/.tmux.conf

tpm: ${HOME}/.tmux/plugins/tpm

${HOME}/.tmux/plugins/tpm:
	git clone --depth 1 https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm

base16: ${BASE16_SHELL_PATH}

base16_update: ${BASE16_SHELL_PATH}
	cd "${BASE16_SHELL_PATH}"
	git pull

powerline: ${HOME}/.local/bin/powerline
${HOME}/.local/bin/powerline:
	pip install --user --upgrade powerline-status

vim: vimplug vimrc

vimrc: ${HOME}/.vimrc

vimplug: ${HOME}/.vim/autoload/plug.vim

${HOME}/.vim/autoload/plug.vim:
	curl -fLo "${HOME}/.vim/autoload/plug.vim" --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

${HOME}/bin/nvim: ${HOME}/bin/nvim.appimage
	ln -s "${HOME}/bin/nvim.appimage" ${HOME}/bin/nvi
	ln -s "${HOME}/bin/nvim.appimage" ${HOME}/bin/nvim
${HOME}/bin/nvim.appimage: | ${HOME}/bin/
	curl -fLo "$@" https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
	chmod u+x ${HOME}/bin/nvim.appimage
nvim_linux: ${HOME}/bin/nvim nvim
nvim: vim ${DOTCONFIG_PATH}/nvim

${DOTCONFIG_PATH}:
	mkdir -p "$@"

${DOTCONFIG_PATH}/nvim: | ${HOME}/.vim ${DOTCONFIG_PATH}
	ln -sf "${HOME}/.vim" "${HOME}/.config/nvim"

${DOTCONFIG_PATH}/nvim/init.vim: ${DOTCONFIG_PATH}/nvim ${HOME}/.vimrc
	ln -sf "${HOME}/.vimrc" "${DOTCONFIG_PATH}/nvim/init.vim"

texmf:
	mkdir -p "${HOME}/texmf/"
	cp -r HOME/texmf/* "${HOME}/texmf/"
	mktexlsr "${HOME}/texmf"

X:	${HOME}/.Xdefaults
	xrdb -merge "$<"

# Fish shell related
${FISH_DIR}:
	mkdir -p "$@"
${FISH_DIR}/fish_plugins: HOME/.config/fish/fish_plugins | ${FISH_DIR}
	cp "$<" "$@"
${FISH_DIR}/functions/fisher.fish: | ${FISH_DIR}/fish_plugins
	fish -c "curl -sL https://git.io/fisher | source && fisher update"
${FISH_DIR}/config.fish: HOME/.config/fish/config.fish | ${FISH_DIR}
	cp "$<" "$@"
${FISH_DIR}/conf.d: HOME/.config/fish/conf.d | ${FISH_DIR}
	cp -r "$<" "$@"

fisher: ${FISH_DIR}/functions/fisher.fish ${FISH_DIR}/fish_plugins

fisher_update: ${FISH_DIR}/functions/fisher.fish ${FISH_DIR}/fish_plugins
	fish -c "fisher update"

fish: base16 ${FISH_DIR}/config.fish ${FISH_DIR}/conf.d fisher

${HOME}/.%: HOME/.%
	cp -r "$<" "$@"
