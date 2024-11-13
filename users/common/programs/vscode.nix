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
          "editor.fontFamily" = "'DejaVuSansM Nerd Font'";
        };
      in
      terminalSettings // otherSettings;
    keybindings = [
      {
        key = "ctrl+[";
        command = "workbench.action.navigateBack";
      }
      {
        key = "ctrl+]";
        command = "workbench.action.navigateForward";
      }
    ];
  };

  # Font settings for VS Code
  home.packages = [
    (pkgs.nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "DejaVuSansMono"
      ];
    })
  ];

  fonts.fontconfig.enable = true;
}
