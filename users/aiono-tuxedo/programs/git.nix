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
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}
