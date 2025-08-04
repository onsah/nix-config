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
  version = "0.16.0";

  # src = fetchurl {
  #   url = "https://codeberg.org/readeck/readeck/releases/download/0.18.2/readeck-0.18.2-linux-amd64";
  #   hash = "sha256-WYxfouw/hnwUEGTX66B+yc+m7hOx7worSTGP4ZkH/WA=";
  #  };
  src = ./readeck;

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/readeck
    chmod +x $out/bin/readeck
  '';
}
