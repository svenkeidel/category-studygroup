{ pkgs ? import <nixpkgs> {} }:

let
  texEnv = pkgs.texlive.combine {
      inherit (pkgs.texlive) scheme-small latexmk pgf tikz-cd;
  };

in pkgs.stdenv.mkDerivation {
  name = "category-studygroup";
  version = "0.0.1";
  src = ./.;
  buildInputs = with pkgs; [
    texEnv
  ];
}
