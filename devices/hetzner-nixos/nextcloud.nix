{ config, pkgs, ... } :
{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud27;
    hostName = "nextcloud.aiono.dev";
    config.adminuser = "root";
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    https = true;
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps)
        news
        tasks
        deck
	calendar
      ;
    };
    extraAppsEnable = true;
    extraOptions = {
      # https://help.nextcloud.com/t/syncing-client-crashes-with-network-error-99/149047/22
      "bulkupload.enabled" = false;
    };
  };
  
  # services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
  #   forceSSL = true;
  #   enableACME = true;
    # sslCertificate = "/var/nginx/ssl/nc-selfsigned.crt";
    # sslCertificateKey = "/var/nginx/ssl/nc-selfsigned.key";
  # };

  # security.acme = {
  #  acceptTerms = true;
  #   defaults.email = "sahinonur2000@hotmail.com";   
  # };
}

