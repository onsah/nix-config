{ ... }:

let
  pkgs = import <nixpkgs-unstable> { };
in
let
  de-en-model-name = "de-en-base";
in
{
  home.packages = [
    pkgs.translatelocally
    pkgs.translatelocally-models.${de-en-model-name}
    (pkgs.writeShellScriptBin "translate-de-en" "echo $1 | ${pkgs.translatelocally}/bin/translateLocally -m ${de-en-model-name}")
  ];
}
