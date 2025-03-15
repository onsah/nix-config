{ lib, ... }:

{
  imports = [
    ../../common/programs
    ../../common/programs/vscode.nix
    ./blackbox.nix
    ./chromium.nix
    ./obsidian.nix
    ./git.nix
    ./newsflash.nix
    ./apostrophe.nix
    ./tuba.nix
    ./denaro.nix
    ./planify.nix
    ./hieroglyphic.nix
    ./papers.nix
    ./nixd.nix
    ./translate.nix
    ./clapper.nix
    ./foliate.nix
    ./tree.nix
    ./npins.nix
    ./zed
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "vscode"
      "obsidian"
      "reaper"
    ];
}
