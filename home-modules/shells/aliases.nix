# Shared aliases for all shells (bash, zsh, fish)
# Note: Fish-specific shortcuts are defined as shellAbbrs in fish/default.nix
# for better performance (abbreviations expand inline, faster than aliases)
{
  # Git
  gcom = "git checkout";
  got = "git";

  # System tools
  open-ports = "ss -tulpn | awk 'NR>1{split($5,a,\":\"); split($7,b,\",\"); if(b[2]) print a[length(a)], b[2]}'";
  rm = "rip";
  loc = "tokei --sort=files --compact";
  rm-dots = ''sudo find . -type f -name "._*" -exec rm -r {} +'';
  walk = "walk --icons";
  reload = "exec $SHELL -l";
  vim = "nvim";
  vi = "nvim";
  ".." = "cd ..";
  "..." = "cd ../..";
  myip = "curl http://ipecho.net/plain; echo";
  dnscheck = "curl https://am.i.mullvad.net/json | jq";
  convert = "magick";
  lzd = "lazydocker";
  lzg = "lazygit";
  yless = "jless --yaml";

  # Modern Unix tools (bat-extras)
  cat = "bat --theme='1337' --paging='never' --style='changes,header,grid'";
  rg = "batgrep --rga --color=always --paging='never' --iglob='!*.lock,!*lock.json,!_'";
  grep = "batgrep --color=always --paging='never' --iglob='!*.lock,!*lock.json,!_'";
  man = "BAT_THEME='Solarized (light)' batman";

  # https://github.com/antfu/taze
  upall = "bunx taze -r";

  # pnpm clean (not in fish abbrs)
  pnc = "pnpm clean";
}
