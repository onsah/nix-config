# Enables hardware acceleration for Firefox etc.
# See: https://nixos.wiki/wiki/Accelerated_Video_Playback
# For testing, see: https://nixos.wiki/wiki/Accelerated_Video_Playback#Testing_your_configuration

{ pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    extraPackages = [
      # https://wiki.archlinux.org/title/Hardware_video_acceleration#Configuring_VA-API
      pkgs.intel-media-driver
    ];
  };

  environment.sessionVariables = {
    # https://wiki.archlinux.org/title/Hardware_video_acceleration#Configuring_VA-API
    # To use `intel-media-driver`
    LIBVA_DRIVER_NAME = "iHD";
  };
}
