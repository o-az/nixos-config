{
  j = "just";
  rm-dots = "sudo find . -type f -name \"._*\" -exec rm -r {} +";
  code = "code-insiders";
  walk = "walk --icons";
  # zed = "/Applications/Zed.app/Contents/MacOS/cli";
  cat = "bat --theme='1337' --paging='never' --style='changes,header,grid'";
  rg = "batgrep --color=always --paging='never' --iglob='!*.lock,!*lock.json,!_'";
  grep = "batgrep --color=always --paging='never' --iglob='!*.lock,!*lock.json,!_'";
  man = "BAT_THEME='Solarized (light)' batman";
  less = "batpipe";
  diff = "batdiff";
  find = "fd";
  reload = "exec $SHELL -l";
  vim = "nvim";
  vi = "nvim";
  ".." = "cd ..";
  "..." = "cd ../..";
  yless = "jless --yaml";
  tree = "eza --all --color='always' --icons='always' --oneline --git-ignore --tree";
  ls = "eza --all --color='always' --icons='always' --oneline --git-ignore";
  dnscheck = "curl https://am.i.mullvad.net/json | jq";
  # https://github.com/antfu/taze
  upall = "bunx taze -r";
  bi = "bun install";
  bd = "bun run dev";
  bb = "bun run build";
  binc = "bun install --no-cache --force";
  pna = "pnpm add";
  pnad = "pnpm add --save-dev";
  pnb = "pnpm build";
  pnc = "pnpm clean";
  pnd = "pnpm dev";
  pns = "pnpm start";
  pnf = "pnpm format";
  pni = "pnpm install";
  pnl = "pnpm lint";
  pnt = "pnpm typecheck";
  myip = "curl http://ipecho.net/plain; echo";
  ga = "git add --all";
  gs = "git status";
  gcm = "git commit -S -m";
  gp = "git push";
  got = "git";
  glog = "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
  convert = "magick";
  lzd = "lazydocker";
  lzg = "lazygit";
}
