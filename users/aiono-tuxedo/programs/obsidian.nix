{ pkgs, ... }:

{
  home.packages = [ pkgs.obsidian ];

  nixpkgs.config.permittedInsecurePackages = [ "electron-33.4.11" ];
}
