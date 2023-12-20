{ pkgs, lib, ... }:

{
  home.packages = [ pkgs.blackbox-terminal ];

  dconf.settings = {
    "com/raggesilver/BlackBox" = with lib.gvariant; {
      # Set padding to 10 for all directions
      terminal-padding =
        mkTuple [ (mkUint32 10) (mkUint32 10) (mkUint32 10) (mkUint32 10) ];
      # Set font size to 10
      font = "DejaVu Sans Mono 10";
    };
  };
}
