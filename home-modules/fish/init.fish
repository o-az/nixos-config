if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x LANG en_US.UTF-8

#-------------------------------------------------------------------------------
# SSH Agent
#-------------------------------------------------------------------------------
function __ssh_agent_is_started -d "check if ssh agent is already started"
    if begin
            test -f $SSH_ENV; and test -z "$SSH_AGENT_PID"
        end
        source $SSH_ENV >/dev/null
    end

    if test -z "$SSH_AGENT_PID"
        return 1
    end

    ssh-add -l >/dev/null 2>&1
    if test $status -eq 2
        return 1
    end
end

function __ssh_agent_start -d "start a new ssh agent"
    ssh-agent -c | sed 's/^echo/#echo/' >$SSH_ENV
    chmod 600 $SSH_ENV
    source $SSH_ENV >/dev/null
    ssh-add
end

if not test -d $HOME/.ssh
    mkdir -p $HOME/.ssh
    chmod 0700 $HOME/.ssh
end

if test -d $HOME/.gnupg
    chmod 0700 $HOME/.gnupg
end

if test -z "$SSH_ENV"
    set -xg SSH_ENV $HOME/.ssh/environment
end

if not __ssh_agent_is_started
    __ssh_agent_start
end

# https://ryantm.github.io/nixpkgs/using/configuration/#sec-allow-broken
set -x NIXPKGS_ALLOW_UNFREE 1

set -Ux XDG_CONFIG_HOME ~/.config

# zoxide - https://github.com/ajeetdsouza/zoxide#flags
zoxide init fish | source
set -U ZOXIDE_ECHO 1

source $HOME/nixos-config/home-modules/fish/functions/ssh_agent_start.fish

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

# forgit
set -x PATH $PATH $FORGIT_INSTALL_DIR/bin
set -Ux FORGIT_CHECKOUT_BRANCH_BRANCH_GIT_OPTS '--sort=-committerdate'
