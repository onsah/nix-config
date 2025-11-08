/**
  readeck executable
*/

{
  stdenv,
  fetchurl,
  lib,
  ...
}:

stdenv.mkDerivation {
  pname = "readeck";
  version = "0.20.0";

  src = fetchurl {
    url = "https://codeberg.org/readeck/readeck/releases/download/0.20.0/readeck-0.20.0-linux-amd64";
    hash = "sha256-mawDfx8jp9/hRK+CT+/vfmB1aamzqCKPb+FZW0SKZgY=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/readeck
    chmod +x $out/bin/readeck
  '';
}
