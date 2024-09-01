{ pkgs, ... }:

let
  unstablePkgs = import <nixpkgs-unstable> { };
  # This lets zed to see installed language servers.
  zed-fhs = unstablePkgs.buildFHSUserEnv {
    name = "zed";
    targetPkgs = pkgs: [ pkgs.zed-editor ];
    runScript = "zed";
  };
in
{
  home.packages = [ zed-fhs ];

  xdg.configFile = {
    "zed/settings.json".source = ./settings.json;
    "zed/keymap.json".source = ./keymap.json;
  };

  home.file = {
    # zed checks here for language servers
    # For reproducibility I install them with nix rather than leaving it to zed.
    ".local/share/zed/languages/pyright" = {
      enable = true;
      source = "${pkgs.pyright}/lib";
    };
  };
}
