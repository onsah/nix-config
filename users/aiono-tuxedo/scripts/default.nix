{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "ncd_nextcloud" (builtins.readFile ./ncd_nextcloud))
    (pkgs.writeShellScriptBin "pipe-audio-in-to-out" (
      import ./pipe-audio-in-to-out.nix { pactl = "${pkgs.pulseaudio}/bin/pactl"; }
    ))
    (pkgs.callPackage ./freiburgvpn.nix { })
  ];
}
