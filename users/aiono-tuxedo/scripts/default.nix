{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "nextcloud_path" (builtins.readFile ./nextcloud_path))
    (pkgs.callPackage ./freiburgvpn.nix { })
    (pkgs.callPackage ./shell-with-packages { })
  ];
}
