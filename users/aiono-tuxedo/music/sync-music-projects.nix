{ pkgs, ... }:

let
  nextcloud-sync-service = import ../../common/systemd/services/nextcloud-sync-service.nix;
in
{
  systemd.user = (
    nextcloud-sync-service {
      inherit pkgs;
      name = "music-projects";
      description = "Sync Music Projects to Nextcloud";
      nextcloudPath = "/Müzik/Recordings";
      localPath = "/home/aiono/Music/Music Recordings";
    }
  );
}
