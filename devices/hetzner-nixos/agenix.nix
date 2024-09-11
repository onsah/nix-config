{ pkgs, ... }:

let sources = import ./npins; in
{
  imports = [
    "${sources.agenix}/modules/age.nix"
  ];

  environment.systemPackages = [ 
    (pkgs.callPackage "${sources.agenix}/pkgs/agenix.nix" {}) 
  ];
}
