{ pkgs, ... }:

{
  home.packages = [ pkgs.zettlr ];

  xdg.configFile = {
    "electron-flags.conf" = {
      enable = true;
      text = ''
        --enable-features=UseOzonePlatform
        --ozone-platform=wayland
      '';
    };
  };
}
