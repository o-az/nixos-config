if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -l is_darwin 0
if test (uname) = Darwin
    set is_darwin 1
end

# Disable fish greeting (only needs to be set once, then persists)
set -g fish_greeting

###
# Shell initialization
###

# Starship prompt
if command -v starship &>/dev/null
    set -gx STARSHIP_SHELL_INTEGRATION_QUERY_TERMINAL 0
    starship init fish | source
end

# Mise (formerly rtx)
if command -v mise &>/dev/null
    mise activate fish | source
end

# Direnv
if command -v direnv &>/dev/null
    direnv hook fish | source
end

# Batman (bat-extras)
if command -v batman &>/dev/null
    batman --export-env | source
end

###
# PATH configuration (using fish_add_path to avoid duplicates)
###

# Bun
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path -g $BUN_INSTALL/bin

# Foundry
fish_add_path -g ~/.foundry/bin

# PNPM
if test $is_darwin -eq 1
    set -gx PNPM_HOME ~/Library/pnpm
else
    set -gx PNPM_HOME ~/.local/share/pnpm
end
fish_add_path -g $PNPM_HOME

# Wasmtime
set -gx WASMTIME_HOME "$HOME/.wasmtime"
fish_add_path -g $WASMTIME_HOME/bin

# Nargo (Noir)
set -gx NARGO_HOME ~/.nargo
fish_add_path -g $NARGO_HOME/bin

# LM Studio CLI
fish_add_path -ga ~/.lmstudio/bin

# Nix
if test -e ~/.nix-profile/etc/profile.d/nix.fish
    source ~/.nix-profile/etc/profile.d/nix.fish
end
fish_add_path -g ~/.nix-profile/bin

# OrbStack integration
if test $is_darwin -eq 1
    source ~/.orbstack/shell/init2.fish 2>/dev/null || :
end

###
# Environment variables
###

if test $is_darwin -eq 1
    set -gx ANDROID_HOME ~/Library/Android/sdk
else
    set -gx ANDROID_HOME ~/Android/Sdk
end
set -gx XDG_CONFIG_HOME ~/.config
set -gx FOUNDRY_DISABLE_NIGHTLY_WARNING 1

# Homebrew curl flags
if test $is_darwin -eq 1
    set -gx LDFLAGS -L/opt/homebrew/opt/curl/lib
    set -gx CPPFLAGS -I/opt/homebrew/opt/curl/include
    set -gx PKG_CONFIG_PATH /opt/homebrew/opt/curl/lib/pkgconfig
end

###
# Event handlers
###

function fish_preexec --on-event fish_preexec
    echo
end

function fish_postexec --on-event fish_postexec
    echo
end

###
# AWS CLI completion
###

###
# FZF configuration
###

if command -v fzf &>/dev/null
    set -g FZF_LEGACY_KEYBINDS 0
    fzf_configure_bindings --directory=\cf --processes=\cp --git_log=\cl --git_status=\cs --history=\ch
    set -gx FZF_FILE_WIDGET_OPTS "--preview 'head {}'"
    set -gx FZF_HISTORY_WIDGET_OPTS "--sort --tac --tiebreak=index --no-sort --preview=''"
    set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git --color=always"
    set -gx FZF_DEFAULT_OPTS "--height 100% --inline-info --layout=reverse --margin=2,2 --multi"
    set -g fzf_git_log_format "%H %s"
    set -g fzf_history_time_format "%y-%m-%d"
    set -g fzf_diff_highlighter diff-so-fancy
end

alias catt bat

alias s "kitten ssh"

###
# Functions - System tools
###

function python
    python3 $argv
end

function bash
    if test $is_darwin -eq 1 -a -x /opt/homebrew/bin/bash
        /opt/homebrew/bin/bash $argv
    else
        command bash $argv
    end
end

function kp
    ssh keypub.sh $argv
end

function zvm
    ~/.zvm/self/zvm $argv
end

function zed
    zed-preview $argv
end

function superfile
    spf $argv
end

function ts
    tailscale $argv
end

function code
    code-insiders $argv
end

function gib
    timg $argv
end

# Modern Unix tools
function bat
    command bat --theme='1337' --paging='never' --style='changes,header,grid' $argv
end

function ls
    eza --all --color='always' --icons='always' --oneline --git-ignore $argv
end

function less
    batpipe $argv
end

function diff
    batdiff $argv
end

function f
    fd $argv
end

function j
    just $argv
end

function tree
    eza --all --color='always' --icons='always' --oneline --tree --color-scale=all $argv
end

###
# Functions - Bun
###

function bb
    bun run build $argv
end

function bd
    bun run dev $argv
end

function bi
    bun install $argv
end

function binc
    bun install --no-cache --force $argv
end

function bnl
    bun lint $argv
end

function bns
    bun start $argv
end

function bnf
    bun format $argv
end

function bnt
    bun typecheck $argv
end

function bnb
    bun build $argv
end

###
# Functions - PNPM
###

function pna
    pnpm add $argv
end

function pnad
    pnpm add --save-dev $argv
end

function pni
    pnpm install $argv
end

function pnd
    pnpm dev $argv
end

function pnb
    pnpm build $argv
end

function pnl
    pnpm lint $argv
end

function pns
    pnpm start $argv
end

function pnf
    pnpm format $argv
end

function pnt
    pnpm typecheck $argv
end

###
# Functions - Yarn
###

function yad
    yarn add --save-dev $argv
end

function yi
    yarn install $argv
end

function yd
    yarn dev $argv
end

function yb
    yarn build $argv
end

function yl
    yarn lint $argv
end

function ys
    yarn start $argv
end

function yf
    yarn format $argv
end

function yt
    yarn typecheck $argv
end

###
# Functions - Git
###

function cm
    git checkout main
end

function rbm
    git rebase origin/main
end

function rbc
    git rebase --continue
end

function rba
    git rebase --abort
end

function gs
    git status $argv
end

function ga
    git add . --all $argv
end

function gcm
    git commit -S --message $argv
end

function gp
    git push $argv
end

function gpl
    git pull $argv
end

function undo
    git reset --soft HEAD~1 $argv
end

function glog
    git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
end
fish_add_path -a $HOME/.config/.amp/bin

# Added by tempoup installer
fish_add_path -a "$HOME/.tempo/bin"

# ami
set --export AMI_INSTALL "$HOME/.ami"
set --export PATH $AMI_INSTALL/bin $PATH

# Added by Antigravity
fish_add_path $HOME/.antigravity/antigravity/bin

if test $is_darwin -eq 1
    test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish
end
