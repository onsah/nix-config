{ writeShellScriptBin, openfortivpn }:

let
  gateway = "fortivpn.uni-freiburg.de";
  port = "443";
  username = "os141@uni-freiburg.de";
in
writeShellScriptBin "freiburg-vpn" "sudo ${openfortivpn}/bin/openfortivpn ${gateway}:${port} --username=${username}"
