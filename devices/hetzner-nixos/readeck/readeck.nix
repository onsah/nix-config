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
  version = "0.18.0";

  src = fetchurl {
    url = "https://codeberg.org/readeck/readeck/releases/download/0.18.0/readeck-0.18.0-linux-amd64";
    hash = "sha256-w5/kWuus31F4yB1OmFP/qKoLXUNwSuoJzjgBKs5mr5A=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/readeck
    chmod +x $out/bin/readeck
  '';
}
