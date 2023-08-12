{ pkgs ? import (fetchTarball "channel:nixos-23.05") {} }:
  pkgs.mkShell {
    nativeBuildInputs = with pkgs; [ 
      nushell
    ];
    shellHook = ''
      export PROJECT_ROOT="$PWD"

      chmod +x ./scripts/set-user.nu
    '';
  }
