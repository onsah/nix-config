{ lib, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-right =
        lib.gvariant.mkArray [ "<Control><Super>Right" ];
      switch-to-workspace-left =
        lib.gvariant.mkArray [ "<Control><Super>Left" ];
    };
    "org/gnome/shell/keybindings" = {
      toggle-overview = lib.gvariant.mkArray [ "<Control><Super>Down" ];
    };
  };
}
