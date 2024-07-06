function git-fzf-log
    git log --oneline --decorate --color=always | fzf --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
        --header 'Press CTRL-S to toggle sort' \
        --preview 'git show --color=always {+1}' | awk '{print $1}'
end

git-fzf-log | xargs -I % git diff %^ %
