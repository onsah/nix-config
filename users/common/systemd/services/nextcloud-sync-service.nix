{
  name,
  description,
  nextcloudPath,
  localPath,
  pkgs,
}:
let
  credentials = import ./secrets.nix;
in
{
  services = {
    "nextcloud-autosync-${name}" = {
      Unit = {
        Description = "Auto sync Nextcloud ${description}";
        After = "network-online.target";
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.nextcloud-client}/bin/nextcloudcmd -h -n --user ${credentials.nextcloud.username} --password ${credentials.nextcloud.password} --path '${nextcloudPath}' '${localPath}' https://nextcloud.aiono.dev";
        TimeoutStopSec = "180";
        KillMode = "process";
        KillSignal = "SIGINT";
      };
      Install.WantedBy = [ "multi-user.target" ];
    };
  };
  timers = {
    "nextcloud-autosync-${name}" = {
      Unit.Description = "Automatic sync files with Nextcloud when booted up after 5 minutes then rerun every 10 seconds";
      Timer.OnCalendar = "*-*-* *:*:00,15,30,45";
      Install.WantedBy = [
        "multi-user.target"
        "timers.target"
      ];
    };
  };
}
