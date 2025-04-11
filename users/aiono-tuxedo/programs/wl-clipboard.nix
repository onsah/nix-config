{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    # So that I can just write `copy` instead of `wl-copy`
    (writeShellScriptBin "copy" ''
      exec -a $0 ${wl-clipboard}/bin/wl-copy "$@"
    '')
  ];
}
