# https://home-manager-options.extranix.com/?query=programs.git.
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
      push = {
        autoSetUpstream = true;
        autoSetupRemote = true;
        default = "current";
      };
      core = {
        editor = "hx";
        excludesfile = "~/.gitignore";
        pager = "diff-so-fancy | less --tabs=2 -RFX";
      };
      interactive.diffFilter = "diff-so-fancy --patch";
      color = {
        ui = true;
        diff-highlight = {
          oldNormal = "red bold";
          oldHighlight = "red bold 52";
          newNormal = "green bold";
          newHighlight = "green bold 22";
        };
        diff = {
          meta = "yellow";
          frag = "magenta bold";
          func = "146 bold";
          commit = "yellow bold";
          old = "red bold";
          new = "green bold";
          whitespace = "red reverse";
        };

      };
    };
    aliases = {
      a = "add";
      aa = "add .";
      au = "add --update";
      b = "branch";
      c = "commit -m";
      cf = "forgit checkout_file";
      cn = "commit --no-verify -m";
      ch = "checkout";
      l = "log";
      p = "push";
      pf = "push --force-with-lease";
      pl = "pull";
      s = "status";
      ga = "add --all";
      gs = "status";
      gcm = "commit -S -m";
      gp = "push";
      glog =
        "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      amend = "commit --amend --reuse-message=HEAD";
      go = "!go() { git checkout -b $1 2> /dev/null || git checkout $1; }; go";
      hist =
        "log --pretty=oneline --pretty=format:'%Cred%h%Creset %C(yellow)%an%Creset %s%C(normal dim)%d%Creset %Cgreen(%cr)%Creset' --date=relative --abbrev-commit";
      monkeys = "shortlog --summary --numbered";
      undo = "reset --soft HEAD^";
      unstage = "reset HEAD --";
    };

    ignores = [
      "_"
      "._*"
      ".env"
      ".envrc"
      "*.un~"
      ".Trashes"
      ".DS_Store"
      ".*.sw[a-z]"
      "Session.vim"
      ".Spotlight-V100"
    ];
  };
}
