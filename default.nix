let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {
    config = {};
  };
  gis = import sources.gitignore { inherit (pkgs) lib; };

  easy-ps = import sources.easy-purescript-nix { inherit pkgs; };

  self = {
    inherit (pkgs) niv;
    inherit pkgs easy-ps;
    inherit (gis) gitignoreSource;
  };

in
  self
