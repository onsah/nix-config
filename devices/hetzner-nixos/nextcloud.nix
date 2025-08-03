{ config, pkgs, ... } :
{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud29;
    hostName = "nextcloud.aiono.dev";
    config.adminuser = "root";
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    https = true;
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps)
        # news
        tasks
        deck
	calendar
      ;
      news = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud/news/releases/download/25.3.1/news.tar.gz";
        sha256 = "sha256-W+YlkyMem+l7oXp169uM35PnNI+psreG0RBo38Ox2nI=";
        license = "agpl3Only";
      };
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

