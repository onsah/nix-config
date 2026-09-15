{ pkgs, ... }:

{
  home.packages = [
    pkgs.nerd-fonts.caskaydia-mono
    pkgs.nerd-fonts.dejavu-sans-mono
    pkgs.nerd-fonts.adwaita-mono
    # I use this for my typst formulas
    pkgs.xits-math
    pkgs.stix-otf
  ];

  fonts.fontconfig.enable = true;
}
