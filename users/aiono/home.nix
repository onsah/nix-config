{ pkgs, ... }:

{
  # Options: https://rycee.gitlab.io/home-manager/options.html

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
    pkgs.vscode
    pkgs.discord
    pkgs.tuba
    pkgs.fractal
    pkgs.spotify
    pkgs.gnome.geary
    pkgs.newsflash
    pkgs.nil
    pkgs.nixpkgs-fmt
    pkgs.vlc
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

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      # Source global definitions
      if [ -f /etc/bashrc ]; then
        . /etc/bashrc
      fi
    '';
    profileExtra = ''
      # Get the aliases and functions
      if [ -f ~/.bashrc ]; then
        . ~/.bashrc
      fi

      if [ -e /home/aiono/.nix-profile/etc/profile.d/nix.sh ]; then . /home/aiono/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
    '';
  };

  targets.genericLinux.enable = true;

  systemd.user = {
    services = {
      nextcloud-autosync-programming-notes =
        let
          credentials = import ./secrets.nix;
        in
        {
          Unit = {
            Description = "Auto sync Nextcloud Programming Notes";
            After = "network-online.target";
          };
          Service = {
            Type = "simple";
            ExecStart = "${pkgs.nextcloud-client}/bin/nextcloudcmd -h -n --user ${credentials.nextcloud.username} --password ${credentials.nextcloud.password} --path /Programming/Notes /home/aiono/Documents/ProgrammingNotes https://nextcloud.aiono.dev";
            TimeoutStopSec = "180";
            KillMode = "process";
            KillSignal = "SIGINT";
          };
          Install.WantedBy = [ "multi-user.target" ];
        };
      nextcloud-autosync-static-analysis-notes =
        let 
          credentials = import ./secrets.nix;
        in
        {
          Unit = {
            Description = "Auto sync Nextcloud Static Analysis Book Notes";
            After = "network-online.target";
          };
          Service = {
            Type = "simple";
            ExecStart = "${pkgs.nextcloud-client}/bin/nextcloudcmd -h -n --user ${credentials.nextcloud.username} --password ${credentials.nextcloud.password} --path /Programming/StaticAnalysis /home/aiono/Documents/Projects/StaticProgramAnalysis https://nextcloud.aiono.dev";
            TimeoutStopSec = "180";
            KillMode = "process";
            KillSignal = "SIGINT";
          };
          Install.WantedBy = [ "multi-user.target" ];
        };
    };
    timers = {
      nextcloud-autosync-programming-notes = {
        Unit.Description = "Automatic sync files with Nextcloud when booted up after 5 minutes then rerun every 10 seconds";
        Timer.OnCalendar = "*-*-* *:*:00,15,30,45";
        Install.WantedBy = [ "multi-user.target" "timers.target" ];
      };
      nextcloud-autosync-static-analysis-notes = {
        Unit.Description = "Automatic sync files with Nextcloud when booted up after 5 minutes then rerun every 10 seconds";
        Timer.OnCalendar = "*-*-* *:*:00,15,30,45";
        Install.WantedBy = [ "multi-user.target" "timers.target" ];
      };
    };
    startServices = true;
  };
}
