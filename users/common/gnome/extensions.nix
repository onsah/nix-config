{ pkgs, ... }:

{
  home.packages = with pkgs.gnomeExtensions; [
    tiling-shell
    gsconnect
    paperwm
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          tiling-shell.extensionUuid
          gsconnect.extensionUuid
          paperwm.extensionUuid
        ];
      };
      "org/gnome/shell/extensions/tilingshell" = {
        enable-autotiling = true;
      };
    };
  };
}
