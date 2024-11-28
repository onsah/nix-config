{ ... }:

{
  # https://nixos.wiki/wiki/Storage_optimization#Automatic
  nix.settings.auto-optimise-store = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}