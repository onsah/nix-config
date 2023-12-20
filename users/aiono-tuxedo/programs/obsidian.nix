{ pkgs, ... }:

{
  home.packages = [ pkgs.obsidian ];

  # Because obsidian uses an old version of obsidian
  nixpkgs.config.permittedInsecurePackages = [
    # TODO: Get relevant electron package from obsidian package
    "electron-25.9.0"
  ];
}
