{ pkgs, ... }:

let unstablePkgs = import <nixpkgs-unstable> { };
in { home.packages = [ unstablePkgs.apostrophe ]; }
