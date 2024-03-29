{ pkgs, ... }:

{
  # Options: https://rycee.gitlab.io/home-manager/options.html
  imports = [ ./programs ./systemd ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "aiono";
  home.homeDirectory = "/home/aiono";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.git
    pkgs.nano
    pkgs.blackbox-terminal
    pkgs.webtorrent_desktop
    pkgs.discord
    pkgs.fractal
    pkgs.spotify
    pkgs.gnome.geary
    pkgs.newsflash
    pkgs.nil
    pkgs.nixpkgs-fmt
    pkgs.vlc
    (pkgs.nerdfonts.override { fonts = [ "CascadiaCode" ]; })
    pkgs.spot
  ];

  nixpkgs.config.allowUnfree = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/aiono/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  targets.genericLinux.enable = true;

  dconf.settings = let
    # Custom Gnome shortcut keybindings
    shortcuts = {
      "org/gnome/settings-daemon/plugins/media-keys" = {
        control-center = [ "<Super>s" ];
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        ];
        www = [ "<Super>f" ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" =
        {
          binding = "<Super>t";
          command = "blackbox";
          name = "Open Terminal";
        };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" =
        {
          binding = "<Super>e";
          command = "flatpak run it.mijorus.smile";
          name = "Emoji Picker";
        };
    };
    # Blackbox settings
    blackbox = {
      "com/raggesilver/BlackBox" = {
        command-as-login-shell = true;
        custom-shell-command = "env nu";
        use-custom-command = true;
        font = "CaskaydiaCove Nerd Font Mono 11";
      };
    };
  in shortcuts // blackbox;
}
