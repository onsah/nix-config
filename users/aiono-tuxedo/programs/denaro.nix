{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.denaro
    # aliasing the name
    (pkgs.writeShellScriptBin "money" "exec -a $0 ${pkgs.denaro}/bin/NickvisionMoney.GNOME $@")
  ];
}
