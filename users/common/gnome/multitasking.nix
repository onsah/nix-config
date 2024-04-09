{ lib, ... }:

{
  dconf.settings = {
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = lib.gvariant.mkBoolean true;
    };
  };
}
