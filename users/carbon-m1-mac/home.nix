{ config, pkgs, lib, ... }:

{
  imports = [ ../common/programs ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "onur";
  home.homeDirectory = "/Users/onur";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [ gnumake ];

  home.file = { ".config/git/config".source = git/config; };

  home.activation = {
    brewBundleHook = let
      brewfile = builtins.toFile "Brewfile" (builtins.readFile brew/Brewfile);
    in lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD /opt/homebrew/bin/brew bundle --file ${brewfile} --no-lock
    '';
  };

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    initExtra = (builtins.readFile zsh/.zshrc);
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.rtx = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = { enableZshIntegration = true; };
}
