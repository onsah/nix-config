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
          "/Freiburg/Courses/Fall Semester/Verification of Digital Circuits";
        localPath =
          "/home/aiono/Documents/Master/Courses/Verification of Digital Circuits/Notes";
      })
    ]);
}
