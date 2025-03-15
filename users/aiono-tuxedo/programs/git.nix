{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    extraConfig = {
      user = {
        name = "Onur Sahin";
        email = "sahinonur2000@hotmail.com";
      };
      # Allows git to store credentials when entered
      # and not ask for the next time
      credential.helper = "${pkgs.gitFull}/bin/git-credential-libsecret";
    };
  };
}
