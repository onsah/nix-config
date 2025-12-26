{ pkgs, ... }:

{
  home.packages = [
    pkgs.nerd-fonts.caskaydia-mono
    pkgs.nerd-fonts.dejavu-sans-mono
    # I use this for my typst formulas
    pkgs.xits-math
  ];

  xdg.dataFile."fonts/Myna".source = ./fonts/Myna.otf;

  fonts.fontconfig.enable = true;
}
