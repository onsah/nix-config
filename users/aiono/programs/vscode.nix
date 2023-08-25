{ ... }:

{
  programs.vscode = {
    enable = true;
    userSettings = {
      "[json]" = {
        "editor.defaultFormatter" = "vscode.json-language-features";
      };
      "nix.enableLanguageServer" = true;
      "nix.formatterPath" = "nixpkgs-fmt";
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        nil = { formatting = { command = [ "nixpkgs-fmt" ]; }; };
        nixd = {
          eval = {
            target = {
              args = [
                "--expr"
                "with import <nixpkgs> { }; callPackage ./users/aiono/home.nix { }"
              ];
              installable = "";
            };
          };
          formatting = { command = "nixpkgs-fmt"; };
          options = {
            enable = true;
            target = {
              args = [ "--expr" "(import <home-manager> {  }).home-manager" ];
              installable = "";
            };
          };
        };
      };
      "window.menuBarVisibility" = "toggle";
      "terminal.integrated.defaultProfile.linux" = "nu";
      "terminal.integrated.profiles.linux" = {
        "bash" = {
          "path" = "bash";
          "icon" = "terminal-bash";
        };
        "nu" = { "path" = "nu"; };
      };
      "terminal.integrated.fontFamily" = "'CaskaydiaCove Nerd Font Mono'";
    };
  };
}
