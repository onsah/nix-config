{ pkgs, ... }:

{
  home.packages = [
    (pkgs.symlinkJoin {
      name = "zettlr";
      paths = [ pkgs.zettlr ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/zettlr --append-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland"
      '';
    })
  ];
}
