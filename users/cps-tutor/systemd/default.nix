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
        localPath = "/mnt/c/Users/Tutor/Documents/ProgrammingNotes";
      })
      (nextcloud-sync-service {
        inherit pkgs;
        name = "cps-tutoring-notes";
        description = "CPS Tutoring Notes";
        nextcloudPath = "/CPS Tutoring";
        localPath = "/mnt/c/Users/Tutor/Documents/CPS-Grading";
      })
      (nextcloud-sync-service {
        inherit pkgs;
        name = "german-notes";
        description = "German Notes";
        nextcloudPath = "/German";
        localPath = "/mnt/c/Users/Tutor/Documents/German";
      })
    ]
  );
}
