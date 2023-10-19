{ pkgs, lib, ... }:
let
  nextcloud-sync-service = import ./nextcloud-sync-service.nix;
  nix-store-cleanup-service = import ./nix-store-cleanup-service.nix;
in {
  systemd.user = (lib.lists.foldl (lib.attrsets.recursiveUpdate) { } [
    ({ startServices = true; })
    (nextcloud-sync-service {
      inherit pkgs;
      name = "programming-notes";
      description = "Programming Notes";
      nextcloudPath = "/Programming/Notes";
      localPath = "/home/aiono/Documents/ProgrammingNotes";
    })
    (nextcloud-sync-service {
      inherit pkgs;
      name = "static-analysis-notes";
      description = "Static Analysis Book Notes";
      nextcloudPath = "/Programming/StaticAnalysis";
      localPath = "/home/aiono/Documents/Projects/StaticProgramAnalysis";
    })
    (nextcloud-sync-service {
      inherit pkgs;
      name = "music-notes";
      description = "Music Notes";
      nextcloudPath = "/Muzik";
      localPath = "/home/aiono/Documents/MusicNotes";
    })
    (nextcloud-sync-service {
      inherit pkgs;
      name = "bozuk-akor-podcast-notes";
      description = "Bozuk Akor Podcast";
      nextcloudPath = "/BozukAkorPodcast";
      localPath = "/home/aiono/Documents/BozukAkorPodcast";
    })
    (nextcloud-sync-service {
      inherit pkgs;
      name = "essentials-of-pls-notes";
      description = "Essentials of Programming Languages Course Notes";
      nextcloudPath =
        "/Freiburg/Courses/Fall Semester/Essentials of Programming Languages/Notes";
      localPath =
        "/home/aiono/Documents/Courses/Essentials of Programming Languages/Notes";
    })
    (nix-store-cleanup-service { inherit pkgs; })
  ]);
}
