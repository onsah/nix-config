{ pkgs, config, ... }:

let
  unstablePkgs = import <nixpkgs-unstable> { };
  dataDir = "/var/lib/actual";
  config = {
    serverFiles = "${dataDir}/server-files";
    userFiles = "${dataDir}/user-files";
    dataDir = dataDir;
  };
  configFile = pkgs.writeText "config.json" (builtins.toJSON config);
in
{
  systemd.services = {
    "actual-server" = {
      description = "Actual Server";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${unstablePkgs.actual-server}/bin/actual-server";
        DynamicUser = true;
        User = "actual";
        Group = "actual";
        StateDirectory = "actual";
        WorkingDirectory = dataDir;
        StateDirectoryMode = "0700";
        Environment = [ "ACTUAL_CONFIG_PATH=${configFile}" ];
      };
    };
  };
}
