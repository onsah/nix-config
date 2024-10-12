{ config, pkgs, ... }:

let blog = import ./blog.nix { }; in
{
  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    forceSSL = true;
    enableACME = true;
  };

  services.nginx.virtualHosts.${blog.hostName} = {
    enableACME = true;
    forceSSL = true;
    root = blog.root;
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "sahinonur2000@hotmail.com";   
  };
}
