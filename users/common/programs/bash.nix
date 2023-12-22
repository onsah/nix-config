{ lib, ... }:

{
  programs.bash = {
    enable = true;
    bashrcExtra = lib.concatStrings [ (builtins.readFile nnn/ncd.sh) ];
  };
}
