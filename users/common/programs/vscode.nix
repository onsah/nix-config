{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
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
          "terminal.integrated.fontFamily" = "'DejaVuSansM Nerd Font'";
        };
        otherSettings = {
          "window.menuBarVisibility" = "toggle";
          "git.confirmSync" = false;
          "files.exclude" = {
            "**/.git" = false;
          };
          "editor.fontFamily" = "'DejaVuSansM Nerd Font'";
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

  home.packages = [
    # Font settings for VS Code
    (pkgs.nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "DejaVuSansMono"
      ];
    })
  ];

  fonts.fontconfig.enable = true;
}
