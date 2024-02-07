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

zoxide init fish | source

for file in $HOME/nixos-config/home-modules/fish/functions/*.fish
    source $file
end

# TODO: find a better way to do this
# gh extension install dlvhdr/gh-dash

cp $HOME/nixos-config/home-modules/fish/fish_plugins $HOME/.config/fish/fish_plugins

direnv hook fish | source
