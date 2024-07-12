{ ... }:

let
  unstablePkgs = import <nixpkgs-unstable> { };
in
{
  home.packages = [ unstablePkgs.zed-editor ];

  xdg.configFile = {
    "zed/settings.json".source = ./settings.json;
  };
}
