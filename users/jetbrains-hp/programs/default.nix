{ pkgs, lib, ... }:
{
  imports = [
    ../../common/programs
  ];

  programs.bash.profileExtra = ''
    if [ -e /home/Onur.Sahin/.nix-profile/etc/profile.d/nix.sh ]; then . /home/Onur.Sahin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
  '';

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vscode" "obsidian"
  ];
}