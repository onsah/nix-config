{ lib, ... }:

{
  dconf.settings = let
    custom-shortcut-settings = {
      "org/gnome/settings-daemon/plugins/media-keys" = {
        control-center = [ "<Super>s" ];
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
        www = [ "<Super>f" ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" =
        {
          binding = "<Super>t";
          command = "blackbox";
          name = "Open Terminal";
        };
    };
  in custom-shortcut-settings // {
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-right =
        lib.gvariant.mkArray [ "<Control><Super>Right" ];
      switch-to-workspace-left =
        lib.gvariant.mkArray [ "<Control><Super>Left" ];
      close = [ "<Control>q" ];
    };
    "org/gnome/shell/keybindings" = {
      toggle-overview = lib.gvariant.mkArray [ "<Control><Super>Down" ];
    };
  };
}
