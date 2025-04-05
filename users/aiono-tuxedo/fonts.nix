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

  fonts.fontconfig.enable = true;
}
