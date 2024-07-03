{ pkgs, ... }:

let
  cert_path = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
in
{
  networking.wireless.networks."eduroam" = {
    hidden = false;
    auth = ''
      ca-cert=${cert_path}
      domain-suffix-match=uni-freiburg.de
      eap=peap;
      identity=os141@uni-freiburg.de
      password=zg$9D$!ffm7KMZ
      phase2-auth=mschapv2
    '';
  };
}
