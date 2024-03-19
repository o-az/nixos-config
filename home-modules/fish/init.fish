if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x LANG en_US.UTF-8

if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

set -Ux XDG_CONFIG_HOME ~/.config

# zoxide init fish | source

for file in $HOME/nixos-config/home-modules/fish/functions/*.fish
    source $file
end

# TODO: find a better way to do this
# gh extension install dlvhdr/gh-dash

direnv hook fish | source
set -g direnv_fish_mode eval_on_arrow # trigger direnv at prompt, and on every arrow-based directory change (default)

cp $HOME/nixos-config/home-modules/fish/fish_plugins $HOME/.config/fish/fish_plugins

set -U FZF_LEGACY_KEYBINDS 0

fzf_configure_bindings --directory=\cf --processes=\cp --git_log=\cl --git_status=\cs --history=\ch

set -Ux FZF_FILE_WIDGET_OPTS "--preview 'head {}'"
set -Ux FZF_HISTORY_WIDGET_OPTS "--sort --tac --tiebreak=index --no-sort --preview=''"
set -Ux FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git --color=always"
set -Ux FZF_DEFAULT_OPTS "--height 80% --inline-info --layout=reverse --margin=2,2 --multi"

set fzf_git_log_format "%H %s"
set fzf_history_time_format %y-%m-%d
set fzf_diff_highlighter diff-so-fancy
