{ pkgs }:
let
  cleanup-generations-name = "nix-cleanup-generations";
  cleanup-store-name = "nix-cleanup-store";
in {
  services = {
    "${cleanup-generations-name}" = {
      Unit = {
        Description = "Cleanup old Nix generations";
        Before = "${cleanup-store-name}.service";
        Requires = "${cleanup-store-name}.service";
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.nix}/bin/nix-env --delete-generations +5";
        KillMode = "process";
        KillSignal = "SIGINT";
      };
      Install.WantedBy = [ "multi-user.target" ];
    };
    "${cleanup-store-name}" = {
      Unit.Description = "Cleanup Nix Store";
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.nix}/bin/nix-store --gc";
        KillMode = "process";
        KillSignal = "SIGINT";
      };
      Install.WantedBy = [ "multi-user.target" ];
    };
  };
  timers = {
    "${cleanup-generations-name}" = {
      Unit.Description =
        "Automatically trigger '${cleanup-generations-name}.service' regulary";
      Timer = {
        # Every Saturday midnight
        OnCalendar = "Sat *-*-* 00:00:00";
        # Run the task if it was not active at the schedule.
        Persistent = true;
      };
      Install.WantedBy = [ "multi-user.target" "timers.target" ];
    };
  };
}
