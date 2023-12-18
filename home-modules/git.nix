{
  programs.git =
    let
      sshSigningKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGUVfIB/tLqTsawr6wzMxa9TJ0llgFEzSiRyFtDkV/gb";
    in
    {
      enable = true;
      userName = "o";
      userEmail = "omaraziz.dev@proton.me";
      lfs.enable = true;
      extraConfig = {
        color.ui = true;
        github.user = "o-az";
        gpg.format = "ssh";
        init.defaultBranch = "main";

        # Fix go private dependency fetching by using SSH instead of HTTPS
        "url \"ssh://git@github.com/\"".insteadOf = "https://github.com/";

        commit.gpgsign = true;
        user.signingkey = sshSigningKey;
        signing = {
          signByDefault = true;
          key = sshSigningKey;
        };
      };
    };
}
