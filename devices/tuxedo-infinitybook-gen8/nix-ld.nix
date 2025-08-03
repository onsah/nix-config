{ pkgs, ... }:

{
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    xorg.libX11
    libGL
    libGLU
  ];
}
