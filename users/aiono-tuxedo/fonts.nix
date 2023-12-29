{ pkgs, ... }:

{
  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "CascadiaCode" "DejaVuSansMono" ]; })
  ];

  fonts.fontconfig.enable = true;
}
