{ pkgs ? import (fetchTarball "channel:nixos-23.05") { } }:
pkgs.mkShell { nativeBuildInputs = with pkgs; [ nushell nixfmt ]; }
