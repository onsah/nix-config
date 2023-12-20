{ pkgs, lib, ... }:

{
  home.packages = [ pkgs.blackbox-terminal ];

  dconf.settings = {
    # Set padding
    "com/raggesilver/BlackBox" = with lib.gvariant; {
      terminal-padding =
        mkTuple [ (mkUint32 10) (mkUint32 10) (mkUint32 10) (mkUint32 10) ];
    };
  };
}
