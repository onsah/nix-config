{ config, ... }:

{
  home.file = {
    "${config.xdg.configHome}/nix/nix.conf" = {
      enable = true;
      text = ''
        extra-experimental-features = nix-command
      '';
    };
  };
}
