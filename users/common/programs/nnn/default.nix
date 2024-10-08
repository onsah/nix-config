{ pkgs, ... }:
{
  programs.nnn = {
    enable = true;
    extraPackages = with pkgs; [ unzip ];
  };
  home.sessionVariables = {
    # nnn file manager flags
    # See https://github.com/jarun/nnn/wiki/Usage#configuration for more information.
    # H: Show hidden files
    # A: No auto-enter during filter
    NNN_OPTS = "HA";
  };
}
