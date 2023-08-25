{ ... }:

{
  programs.bash = {
    enable = true;
    bashrcExtra = "";
    profileExtra = ''
      if [ -e /home/aiono/.nix-profile/etc/profile.d/nix.sh ]; then . /home/aiono/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
    '';
  };
}
