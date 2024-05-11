{ pkgs, lib, ... }:

let
  nextcloud-sync-service =
    import ../../common/systemd/services/nextcloud-sync-service.nix;
in {
  systemd.user =
    (lib.lists.foldl (lib.attrsets.recursiveUpdate) { startServices = true; } [
      (nextcloud-sync-service {
        inherit pkgs;
        name = "cyber-physical-notes";
        description = "Cyber Physical Notes";
        nextcloudPath =
          "/Freiburg/Courses/Fall Semester/Cyber-Physical Systems: Discrete Models";
        localPath =
          "/home/aiono/Documents/Master/Courses/Cyber-Physical Systems/Notes";
      })
      (nextcloud-sync-service {
        inherit pkgs;
        name = "verification-of-digital-circuits-notes";
        description = "Verification of Digital Circuits Notes";
        nextcloudPath =
          "/Freiburg/Courses/Fall Semester/Verification of Digital Circuits/Notes";
        localPath =
          "/home/aiono/Documents/Master/Courses/Verification of Digital Circuits/Notes";
      })
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
        localPath = "/home/aiono/Documents/NextcloudSynced/Politics";
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
        name = "software-engineering-notes";
        description = "Software Engineering Course Notes";
        nextcloudPath =
          "/Freiburg/Courses/Spring Semester/Software Engineering";
        localPath =
          "/home/aiono/Documents/Master/Courses/software-engineering/Notes";
      })
    ]);
}
