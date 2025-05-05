{ pkgs, ... }:

{
  home.packages = with pkgs.gnomeExtensions; [
    tiling-shell
    gsconnect
  ];

  dconf.settings = {
    enable = true;
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        tiling-shell.extensionUuid
        gsconnect.extensionUuid
      ];
    };
  };
}
