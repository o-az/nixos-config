{ pkgs, ... }: {
  nix = {
    package = pkgs.nixUnstable;
    settings = {
      sandbox = "relaxed";
      trusted-users = [ "root" "omar" ];
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [
        "https://union.cachix.org/"
        "https://nix-community.cachix.org/"
        "https://helix.cachix.org/"
      ];
      trusted-substituters =
        [ "https://nix-community.cachix.org" "https://union.cachix.org" ];
      trusted-public-keys = [
        "union.cachix.org-1:TV9o8jexzNVbM1VNBOq9fu8NK+hL6ZhOyOh0quATy+M="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      ];
    };
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };
}
