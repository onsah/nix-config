{ pkgs, ... }:

{
  home.packages = [ pkgs.ghostty ];

  home.file."/home/aiono/.config/ghostty/config" = {
    text = ''
      theme = light:Adwaita,dark:Adwaita Dark
      font-family = DejaVu Sans Mono
      font-size = 11
      window-width = 100
      window-height = 26
    '';
  };

  # Assign <super>+t to open ghostty for Gnome Desktop
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>t";
      command = "${pkgs.ghostty}/bin/ghostty";
      name = "Open Terminal";
    };
  };
}
