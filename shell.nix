{ pkgs ? import (fetchTarball "channel:nixos-23.05") {} }:
  pkgs.mkShell {
    nativeBuildInputs = with pkgs; [ 
      nushell
      nixfmt
    ];
    shellHook = ''
      export PROJECT_ROOT="$PWD"

      alias format='nixfmt users/**/*.nix'

      chmod +x ./scripts/set-user.nu
    '';
  }
