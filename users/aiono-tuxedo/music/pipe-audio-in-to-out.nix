{ pkgs, ... }:

let
  pactl = "${pkgs.pulseaudio}/bin/pactl";
  script = ''
    #!/usr/bin/env sh

    ${pactl} load-module module-loopback

    PID=$$

    # Remove pipe when interrupted
    trap "${pactl} unload-module module-loopback" INT TERM

    echo "Press Ctrl^C to exit"

    # Block forever until an interrupt signal is received
    sleep 2147483647
  '';
in
{
  home.packages = [ (pkgs.writeShellScriptBin "pipe-audio-in-to-out" script) ];
}
