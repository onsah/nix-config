{ pkgs, ... }:

{
  home.packages = [ (pkgs.callPackage ./build.nix { }) ];
}
