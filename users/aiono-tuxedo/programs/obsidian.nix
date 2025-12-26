{ pkgs, ... }:

{
  home.packages = [ pkgs.obsidian ];

  nixpkgs.config.permittedInsecurePackages = [ "electron-36.9.5" ];
}
