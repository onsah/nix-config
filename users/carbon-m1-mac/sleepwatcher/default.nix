{ ... }:

{
  # Relies on `sleepwatcher` and `blueutil` util to be installed via brew

  home.file = {
    ".config/sleepwatcher/sleep" = {
      executable = true;
      source = ./sleep;
    };
    ".config/sleepwatcher/wakeup" = {
      executable = true;
      source = ./wakeup;
    };
  }; 

  launchd = {
    enable = true;
    agents = {
      sleepwatcher = {
        enable = true;
        config = {
          Label = "Sleepwatcher";
          ProgramArguments = [
            "/opt/homebrew/sbin/sleepwatcher"
            "--sleep"
            "~/.config/sleepwatcher/sleep"
            "--wakeup"
            "~/.config/sleepwatcher/wakeup"
          ];
          RunAtLoad = true;
          KeepAlive = true;
          StandardErrorPath = /Users/onur/sleepwatcher.log;
        };
      };
    };
  };
}
