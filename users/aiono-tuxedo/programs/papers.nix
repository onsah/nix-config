{ ... }:

let
  unstablePkgs = import <nixpkgs-unstable> { };
in
{
  home.packages = [ unstablePkgs.papers ];
}
