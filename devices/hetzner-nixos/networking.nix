{ config, ... }:
{
  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    forceSSL = true;
    enableACME = true;
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "sahinonur2000@hotmail.com";   
  };
}
