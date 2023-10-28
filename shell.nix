{ pkgs ? import (fetchTarball "channel:nixos-23.05") { } }:
let
  project_root = builtins.toString ./.;
  scripts_dir = builtins.toString ./scripts;
  users_dir = builtins.toString ./users;
in pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ nushell nixfmt ];
  shellHook = ''
    export PROJECT_ROOT=${project_root};
  '';
}
