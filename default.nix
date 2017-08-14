{ pkgs ? import <nixpkgs> {} }:

let
  texEnv = pkgs.texlive.combine {
      inherit (pkgs.texlive) scheme-small latexmk pgf tikz-cd biblatex logreq xstring;
  };

in pkgs.stdenv.mkDerivation {
  name = "category-studygroup";
  version = "0.0.1";
  src = ./.;
  buildInputs = with pkgs; [
    texEnv biber
  ];
  installPhase = ''
    mkdir $out
    cp pdf/*.pdf $out
  '';
}
