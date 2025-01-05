/**
  readeck executable
*/

{
  stdenv,
  fetchurl,
  lib,
  ...
}:

let
  readeckBinary = fetchurl {
    url = "https://codeberg.org/readeck/readeck/releases/download/0.16.0/readeck-0.16.0-linux-amd64";
    hash = "sha256-N+NVAQY5Kk423UhrVXKbjU7N6ftOv5Q8ZnrU3QIhpJA=";
  };
  fs = lib.fileset;
in
stdenv.mkDerivation {
  pname = "readeck";
  version = "2.12.1";

  src = fs.toSource {
    root = ./.;
    fileset = fs.unions [ ];
  };

  buildPhase = '''';

  installPhase = ''
    mkdir -p $out
    mkdir -p $out/bin
    cp ${readeckBinary} $out/bin/readeck
    chmod +x $out/bin/readeck
  '';
}
