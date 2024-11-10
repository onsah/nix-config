{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "ncd_nextcloud" (builtins.readFile ./ncd_nextcloud))
    (pkgs.callPackage ./freiburgvpn.nix { })
  ];
}
