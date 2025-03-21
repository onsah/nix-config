# Enables hardware acceleration for Firefox etc.
# See: https://nixos.wiki/wiki/Accelerated_Video_Playback
# For testing, see: https://nixos.wiki/wiki/Accelerated_Video_Playback#Testing_your_configuration

{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    extraPackages = [
      # https://wiki.archlinux.org/title/Hardware_video_acceleration#Configuring_VA-API
      pkgs.intel-media-driver
    ];
  };

  environment.sessionVariables = {
    # https://wiki.archlinux.org/title/Hardware_video_acceleration#Configuring_VA-API
    # To use `intel-media-driver`
    # TODO: Parse the library name instead of hardcoding
    LIBVA_DRIVER_NAME = "iHD";
  };
}
