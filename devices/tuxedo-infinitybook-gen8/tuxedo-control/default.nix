{ lib, ... }:

let fileset = lib.fileset;
in {
  hardware.tuxedo-rs = { enable = true; };

  # See `Managing profiles` section in README
  environment.etc = {
    "tailord/profiles".source = fileset.toSource {
      root = ./etc/profiles;
      fileset = ./etc/profiles;
    };
    "tailord/fan".source = fileset.toSource {
      root = ./etc/fan;
      fileset = ./etc/fan;
    };
    "tailord/keyboard".source = fileset.toSource {
      root = ./etc/keyboard;
      fileset = ./etc/keyboard;
    };
  };
}
