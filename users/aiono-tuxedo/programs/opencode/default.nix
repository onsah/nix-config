{ ... }:
let
  unstablePkgs = import <nixpkgs-unstable> { };
in
{
  home.packages = [
    unstablePkgs.opencode
    unstablePkgs.libnotify
  ];

  home.file.".config/opencode/plugins/notification.js".source = ./notification.js;
}
