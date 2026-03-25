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
        localPath = "/home/Onur.Sahin/Documents/NextcloudSynced/Programming Notes";
      })
    ]
  );
}
