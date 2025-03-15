{
  pkgs,
  lib,
  hostPlatform,
  ...
}:

let
  de-en-model-name = "de-en-base";
in
{
  home.packages = [
    # Temporary fix until https://github.com/NixOS/nixpkgs/pull/385549
    (pkgs.translatelocally.overrideAttrs {
      cmakeFlags = [
        "-DBLAS_LIBRARIES=-lblas"
        "-DCBLAS_LIBRARIES=-lcblas"

        # See the following for context:
        # https://github.com/NixOS/nixpkgs/pull/385549
        (lib.optionalString pkgs.hostPlatform.isx86_64 "-DBUILD_ARCH=x86-64")
      ];
    })
    pkgs.translatelocally-models.${de-en-model-name}
    (pkgs.writeShellScriptBin "translate-de-en" "echo $1 | ${pkgs.translatelocally}/bin/translateLocally -m ${de-en-model-name}")
  ];
}
