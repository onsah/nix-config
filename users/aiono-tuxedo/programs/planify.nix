{ pkgs, ... }:

let unstablePkgs = import <nixpkgs-unstable> { };
in {
  home.packages = [
    unstablePkgs.planify
    (pkgs.writeShellScriptBin "tasks"
      "${unstablePkgs.planify}/bin/io.github.alainm23.planify")
  ];
}
