{ pkgs, lib, ... }:
{
  imports = [
    ../../common/programs
    ../../common/programs/vscode.nix
    ../../common/programs/wl-clipboard.nix
    ../../common/programs/nushell
  ];

  programs.bash.profileExtra = ''
    if [ -e /home/Onur.Sahin/.nix-profile/etc/profile.d/nix.sh ]; then . /home/Onur.Sahin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
  '';

  programs.bash.bashrcExtra = ''
    export PATH=$HOME/.local/bin:$PATH;
  '';

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "vscode"
      "obsidian"
    ];

  home.packages = with pkgs; [
    scala-cli
    opencode
    codex
    bun
    nil
  ];

  programs.vscode.package = pkgs.vscode.overrideAttrs (oldAttrs: {
    buildInputs = (oldAttrs.buildInputs or [ ]) ++ [ pkgs.makeWrapper ];
    postInstall =
      (oldAttrs.postInstall or "")
      + ''
        wrapProgram $out/bin/code \
          --add-flags "--no-sandbox"
      '';
  });
}
