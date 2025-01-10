{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "ncd_nextcloud" (builtins.readFile ./ncd_nextcloud))
    (pkgs.callPackage ./freiburgvpn.nix { })
    (pkgs.callPackage ./shell-with-packages { })
  ];
}
