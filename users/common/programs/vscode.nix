{ pkgs, ... }:

let
  font-family = "'Adwaita Mono'";
in
{
  programs.vscode.enable = true;
  programs.vscode.profiles.default = {
    userSettings =
      let
        terminalSettings = {
          "terminal.integrated.defaultProfile.linux" = "bash";
          "terminal.integrated.profiles.linux" = {
            "bash" = {
              # For some reason, default bash has weird font issues.
              "path" = "${pkgs.bashInteractive}/bin/bash";
              "icon" = "terminal-bash";
            };
          };
          "terminal.integrated.fontFamily" = "${font-family}";
        };
        otherSettings = {
          "window.menuBarVisibility" = "toggle";
          "git.confirmSync" = false;
          "files.exclude" = {
            "**/.git" = false;
          };
          "editor.fontFamily" = "${font-family}";
          "editor.wordWrap" = "on";
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "${pkgs.nil}/bin/nil";
          "nix.serverSettings" = {
            "nil" = {
              "formatting" = {
                command = [ "${pkgs.nixfmt}/bin/nixfmt" ];
              };
            };
          };
          "editor.inlineSuggest.edits.allowCodeShifting" = "always";
          "github.copilot.nextEditSuggestions.enabled" = false;
          "github.copilot.enable" = {
            "*" = false;
            "plaintext" = false;
            "markdown" = false;
            "scminput" = false;
          };
        };
      in
      terminalSettings // otherSettings;
    keybindings = [
      {
        key = "ctrl+[BracketLeft]";
        command = "workbench.action.navigateBack";
      }
      {
        key = "ctrl+[BracketRight]";
        command = "workbench.action.navigateForward";
      }
    ];
  };

  home.packages = with pkgs.nerd-fonts; [
    # Font settings for VS Code
    caskaydia-mono
    dejavu-sans-mono
    adwaita-mono
  ];

  fonts.fontconfig.enable = true;
}
