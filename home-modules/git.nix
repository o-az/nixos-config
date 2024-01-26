{
  programs.git = let
    sshSigningKey =
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGnFdSHtSGiwHlDEESfJseOArZ8HNCVlIcreGc2VS7b2";
  in {
    enable = true;
    userName = "o-az";
    userEmail = "omaraziz.dev@proton.me";
    lfs.enable = true;
    extraConfig = {
      color.ui = true;
      github.user = "o-az";
      gpg.format = "ssh";
      init.defaultBranch = "main";
      url."git@github.com:".insteadOf = "https://github.com/";
      commit.gpgsign = true;
      user.signingkey = sshSigningKey;
      signing = {
        signByDefault = true;
        key = sshSigningKey;
      };
    };
    aliases = {
      a = "add";
      aa = "add .";
      au = "add --update";
      b = "branch";
      c = "commit -m";
      cn = "commit --no-verify -m";
      ch = "checkout";
      l = "log";
      p = "push";
      pf = "push --force";
      pl = "pull";
      s = "status";

      amend = "commit --amend --reuse-message=HEAD";
      go = "!go() { git checkout -b $1 2> /dev/null || git checkout $1; }; go";
      hist =
        "log --pretty=oneline --pretty=format:'%Cred%h%Creset %C(yellow)%an%Creset %s%C(normal dim)%d%Creset %Cgreen(%cr)%Creset' --date=relative --abbrev-commit";
      monkeys = "shortlog --summary --numbered";
      undo = "reset --soft HEAD^";
      unstage = "reset HEAD --";
    };

    ignores = [
      "*.un~"
      ".*.sw[a-z]"
      ".DS_Store"
      ".Spotlight-V100"
      ".Trashes"
      "._*"
      ".env"
      ".envrc"
      "Session.vim"
    ];
  };
}
