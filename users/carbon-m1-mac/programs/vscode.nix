{ ... }:
let
  nixSettings = {
    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "nil";
  };
in {
  programs.vscode = {
    enable = true;
    userSettings = {
      "terminal.integrated.fontFamily" = "'CaskaydiaCove Nerd Font Mono'";
      "terminal.integrated.defaultProfile.osx" = "zsh";
    } // nixSettings;
  };
}
