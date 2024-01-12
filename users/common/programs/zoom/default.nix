{ pkgs, ... }:

{
  home.packages = [ pkgs.zoom-us ];

  home.file = { ".config/zoomus.conf".text = builtins.readFile ./zoomus.conf; };

  home.sessionVariables = { "QT_QPA_PLATFORM" = "wayland"; };
}
