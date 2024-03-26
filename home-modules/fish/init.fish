if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x LANG en_US.UTF-8

# https://ryantm.github.io/nixpkgs/using/configuration/#sec-allow-broken
set -x NIXPKGS_ALLOW_UNFREE 1
set -x NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM 1

set -Ux XDG_CONFIG_HOME ~/.config

zoxide init fish | source

# forgit
set -gx PATH $PATH $FORGIT_INSTALL_DIR/bin
set -U FORGIT_CHECKOUT_BRANCH_BRANCH_GIT_OPTS '--sort=-committerdate'
set -gx forgit_log glo
set -gx forgit_diff gd
set -gx forgit_add ga
set -gx forgit_reset_head grh
set -gx forgit_ignore gi
set -gx forgit_checkout_file gcf
set -gx forgit_checkout_branch gcb
set -gx forgit_branch_delete gbd
set -gx forgit_checkout_tag gct
set -gx forgit_checkout_commit gco
set -gx forgit_revert_commit grc
set -gx forgit_clean gclean
set -gx forgit_stash_show gss
set -gx forgit_stash_push gsp
set -gx forgit_cherry_pick gcp
set -gx forgit_rebase grb
set -gx forgit_blame gbl
set -gx forgit_fixup gfu

# direnv
direnv hook fish | source
set -g direnv_fish_mode eval_on_arrow # trigger direnv at prompt, and on every arrow-based directory change (default)

# bat
eval (batpipe)

# fzf
set -U FZF_LEGACY_KEYBINDS 0
fzf_configure_bindings --directory=\cf --processes=\cp --git_log=\cl --git_status=\cs --history=\ch
set -Ux FZF_FILE_WIDGET_OPTS "--preview 'head {}'"
set -Ux FZF_HISTORY_WIDGET_OPTS "--sort --tac --tiebreak=index --no-sort --preview=''"
set -Ux FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git --color=always"
set -Ux FZF_DEFAULT_OPTS "--height 100% --inline-info --layout=reverse --margin=2,2 --multi"
set fzf_git_log_format "%H %s"
set fzf_history_time_format "%y-%m-%d"
set fzf_diff_highlighter diff-so-fancy
