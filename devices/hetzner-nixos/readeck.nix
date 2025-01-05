{ ... }:

{
  users.users.readeck = {
    isNormalUser = true;
    home = "/home/readeck";
    description = "User for Readeck service";
    extraGroups = [ ];
    openssh.authorizedKeys.keys = [ ];
  };

  /*
    systemd.services.readeck = {
      description = "Track stuff to read/watch/listen across devices";
      wantedBy = ["multi-user.target"];
      after = ["network.target"];
    };
  */
}
