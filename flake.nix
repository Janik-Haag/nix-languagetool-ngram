{
  description = "Packages for the languagetool ngram-data";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      packages = import ./common.nix { inherit pkgs; };
    in rec {
      inherit packages;
      checks = packages;
    }
  );
}
