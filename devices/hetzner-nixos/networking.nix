{ config, pkgs, ... }:

{
  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    forceSSL = true;
    enableACME = true;
  };

  services.nginx.virtualHosts."blog.aiono.dev" = {
    enableACME = true;
    forceSSL = true;
    root = "/etc/blog";
  };

  services.nginx.virtualHosts."reading.aiono.dev" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:8000";
      extraConfig =
        # required when the target is also TLS server with multiple hosts
        "proxy_ssl_server_name on;"
        +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "sahinonur2000@hotmail.com";
  };
}
