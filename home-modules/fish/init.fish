if status is-interactive
  # Commands to run in interactive sessions can go here
end

export IS_THIS_WORKING='yes'

set -x LANG en_US.UTF-8

if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

for file in $HOME/nixos-config/home-modules/fish/functions/*.fish
  source $file
end
