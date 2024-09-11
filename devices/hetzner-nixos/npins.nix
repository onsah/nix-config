{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.npins
  ];
}
