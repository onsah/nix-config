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
    ]);
}
