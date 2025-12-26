{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./programs
    ./scripts
    ./systemd
    ./music
    ./fonts.nix
    ./nix.nix
    ../common/linux.nix
    ../common/gnome
  ];

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
  home.stateVersion = "23.11"; # Please read the comment before changing.

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

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/aiono/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # Launch VSCode in Wayland
    NIXOS_OZONE_WL = 1;
    # Location to my self-hosted nextcloud
    NC_DAV_URL = "davs://nextcloud.aiono.dev/remote.php/webdav/";
    NC_PATH = "/run/user/1000/gvfs/dav:host=nextcloud.aiono.dev,ssl=true,prefix=%2Fremote.php%2Fwebdav";
    # Ip address of my self hosted server
    SELF_HOSTED_SERVER_IP_V4 = "159.69.94.155";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
      dynamic-workspaces = true;
    };
  };
}
