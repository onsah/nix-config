{ pkgs, ... }:

let
  stagingNextPkgs =
    import
      (fetchTarball "https://github.com/NixOS/nixpkgs/tarball/614efe64e87d1450428e4fde0024eb784d06ba20")
      { };
  # This lets zed to see installed language servers.
  zed-fhs = stagingNextPkgs.buildFHSUserEnv {
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
