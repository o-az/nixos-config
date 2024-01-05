{
  programs.git =
    let
      sshSigningKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGnFdSHtSGiwHlDEESfJseOArZ8HNCVlIcreGc2VS7b2";
    in
    {
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
    };
}
