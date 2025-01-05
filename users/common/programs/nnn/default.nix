{ pkgs, ... }:
{
  programs.nnn = {
    enable = true;
    # Necessary for extracting different archive formats https://gist.github.com/moalex/b823da9905cfac65abbdf62373d6b6bb
    extraPackages = with pkgs; [
      unzip
      libarchive
    ];
  };
  home.sessionVariables = {
    # nnn file manager flags
    # See https://github.com/jarun/nnn/wiki/Usage#configuration for more information.
    # H: Show hidden files
    # A: No auto-enter during filter
    NNN_OPTS = "HA";
  };
}
