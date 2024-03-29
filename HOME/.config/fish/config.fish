if status --is-interactive
    set -x fish_greeting ""

    source $HOME/.config/base16-shell/profile_helper.fish
    base16-onedark

    set -g theme_color_scheme terminal
    set -g theme_display_date no
    set -g theme_display_hg yes
    set -g theme_show_exit_status yes
    set -g theme_newline_cursor yes
end
