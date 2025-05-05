{ pkgs, ... }:

{
  home.packages = [ pkgs.gnomeExtensions.tiling-shell ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [ "tilingshell@ferrarodomenico.com" ];
    };
  };
}
