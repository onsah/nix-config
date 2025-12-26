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
    url = "https://codeberg.org/readeck/readeck/releases/download/0.21.5/readeck-0.21.5-linux-amd64";
    hash = "sha256-Q30HCHkG8ebTR73HkNXRfmtEEXT4WsOJcAxmeSm2JGU=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/readeck
    chmod +x $out/bin/readeck
  '';
}
