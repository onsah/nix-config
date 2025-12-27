{ pkgs, ... }:

{
  home.packages = [
    pkgs.ghostty
    pkgs.nerd-fonts.adwaita-mono
  ];

  home.file."/home/aiono/.config/ghostty/config" = {
    text = ''
      theme = light:Adwaita,dark:Adwaita Dark
      font-family = Adwaita Mono
      font-size = 11
      window-width = 100
      window-height = 26
      keybind = f11=toggle_fullscreen
      command = ${pkgs.nushell}/bin/nu
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

  fonts.fontconfig.enable = true;
}
