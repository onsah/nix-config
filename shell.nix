{ pkgs ? import (fetchTarball "channel:nixos-23.05") { } }:
let
  project_root = builtins.toString ./.;
  scripts_dir = builtins.toString ./scripts;
  users_dir = builtins.toString ./users;
in pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ nushell nixfmt ];
  shellHook = ''
    export PROJECT_ROOT=${project_root};

    function format {
      nixfmt ${users_dir}/**/*.nix shell.nix;
    }

    export -f format;

    # Setup
    chmod +x ${scripts_dir}/*.nu;
    chmod +x .git/hooks/pre-commit;
  '';
}
