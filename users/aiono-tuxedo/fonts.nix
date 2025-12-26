{ pkgs, ... }:

{
  home.packages = [
    (pkgs.nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "DejaVuSansMono"
      ];
    })
    # I use this for my typst formulas
    pkgs.xits-math
  ];

  xdg.dataFile."fonts/Myna".source = ./fonts/Myna.otf;

  fonts.fontconfig.enable = true;
}
