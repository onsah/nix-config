/**
  Based on https://readeck.org/en/docs/deploy and https://mtlynch.io/notes/simple-go-web-service-nixos/.

  Config file can be found in `/home/readeck/config.toml`. Because it's read/write, I can't manage it with Nix.
*/

{ pkgs, ... }:

let
  readeckStateDirectory = "readeck";
  readeck = pkgs.callPackage ./readeck.nix { };
in
{
  # https://nlewo.github.io/nixos-manual-sphinx/configuration/user-mgmt.xml.html
  users.users.readeck = {
    isNormalUser = true;
    home = "/home/readeck";
    description = "User for Readeck service";
    extraGroups = [ ];
    openssh.authorizedKeys.keys = [ ];
  };

  systemd.services.readeck = {
    description = "Readeck service";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      # readeck keeps state in the current directory
      ExecStart = "${readeck}/bin/readeck serve";
      WorkingDirectory = "/home/readeck";
      User = "readeck";
      # Restart = "on-failure";
      # RestartSec = 5;

      # Sandboxing
      ProtectSystem = "full";
      ReadWritePaths = "/home/readeck";
      MemoryDenyWriteExecute = true;
      NoNewPrivileges = true;
      PrivateTmp = true;
      PrivateDevices = "yes";
      RestrictAddressFamilies = "AF_UNIX AF_INET AF_INET6 AF_NETLINK";
      RestrictNamespaces = "yes";
      RestrictRealtime = "yes";
      DevicePolicy = "closed";
      ProtectClock = "yes";
      ProtectHostname = "yes";
      ProtectProc = "invisible";
      ProtectControlGroups = "yes";
      ProtectKernelModules = "yes";
      ProtectKernelTunables = "yes";
      LockPersonality = "yes";
      SystemCallArchitectures = "native";
      SystemCallFilter = "~@clock @debug @module @mount @obsolete @reboot @setuid @swap @cpu-emulation @privileged";
    };
  };
}
