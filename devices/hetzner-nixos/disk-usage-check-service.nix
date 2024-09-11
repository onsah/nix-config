{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mailutils
  ];

  programs.msmtp = {
    enable = true;
    accounts.default = {
      auth = true;
      tls = true;
      tls_starttls = true;
      tls_trust_file = "/etc/ssl/certs/ca-bundle.crt";
      from = "sahinonur2000@hotmail.com";
      host = "smtp-mail.outlook.com";
      user = "sahinonur2000@hotmail.com";
      passwordeval = "cat /secrets/sahinonur_stmp_password.txt";
      port = 587;
    };
  };
}
