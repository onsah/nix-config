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

  src = fetchurl {
    url = "https://codeberg.org/readeck/readeck/releases/download/0.16.0/readeck-0.16.0-linux-amd64";
    hash = "sha256-N+NVAQY5Kk423UhrVXKbjU7N6ftOv5Q8ZnrU3QIhpJA=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/readeck
    chmod +x $out/bin/readeck
  '';
}
