{ ... }:
{
  programs.nnn = {
    enable = true;
  };
  home.sessionVariables = {
    # nnn file manager flags
    # H: show hidden files
    NNN_OPTS = "H";
  };
}