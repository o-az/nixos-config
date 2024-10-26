{
  pls,
  pkgs,
  ...
}:
let
  packageName = "pls";
  plsPackage = pkgs.rustPlatform.buildRustPackage rec {
    src = pls;
    pname = packageName;
    version = "v0.0.1-beta.9";
    cargoHash = "sha256-3q6ZBTd0Q8bkXKrW4Qik39zQsjh05Zwe3uuUEv5DLsc=";

    meta.mainProgram = packageName;
  };
in
{
  home.packages = [
    plsPackage
  ];
}
