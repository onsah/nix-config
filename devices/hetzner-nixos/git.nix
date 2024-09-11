{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    config = {
      user = {
        name = "Onur Sahin";
        email = "sahinonur2000@hotmail.com";
      };
    };
  };
}
