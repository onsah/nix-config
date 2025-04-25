{ ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      format = "$all$username$character";
      directory = {
        home_symbol = "~";
        format = "at [$path]($style)[$read_only]($read_only_style) ";
      };
      username = {
        show_always = true;
        format = "[$user]($style) ";
      };
      scala = {
        # By default .metals folders trigger symbol. But .metals is generated automatically at home directory.
        detect_folders = [ ];
      };
    };
  };
}
