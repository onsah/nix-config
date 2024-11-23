{ pkgs, lib, ... }:

let
  nextcloud-sync-service = import ../../common/systemd/services/nextcloud-sync-service.nix;
in
{
  systemd.user = (
    lib.lists.foldl (lib.attrsets.recursiveUpdate) { startServices = true; } [
      (nextcloud-sync-service {
        inherit pkgs;
        name = "programming-notes";
        description = "Programming Notes";
        nextcloudPath = "/Programming/Notes";
        localPath = "/home/aiono/Documents/NextcloudSynced/Programming/Notes";
      })
      (nextcloud-sync-service {
        inherit pkgs;
        name = "politics-notes";
        description = "Politics Notes";
        nextcloudPath = "/Politics";
        localPath = "/home/aiono/Documents/NextcloudSynced/Politics/Notes";
      })
      (nextcloud-sync-service {
        inherit pkgs;
        name = "german-notes";
        description = "German Notes";
        nextcloudPath = "/German";
        localPath = "/home/aiono/Documents/NextcloudSynced/German";
      })
      (nextcloud-sync-service {
        inherit pkgs;
        name = "cps-grading";
        description = "CPS Grading Stuff";
        nextcloudPath = "/CPS Tutoring";
        localPath = "/home/aiono/Documents/Master/CPS-Tutoring/CPS-Grading";
      })
    ]
  );
}
