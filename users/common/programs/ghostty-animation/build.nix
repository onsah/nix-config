{
  stdenv,
  fetchFromGitHub,
  rustPlatform,
  lib,
}:
rustPlatform.buildRustPackage {
  pname = "ghostty-animation";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "lukeshere";
    repo = "ghostty-animation-command";
    rev = "d84b52d17cf904d0d98bf2ed9a1e10144bc2a19a";
    sha256 = "sha256-hggqu4sJ9xWZUhnShlErpuZoV6wWHsapFu7oD/s6Fzw=";
  };

  cargoHash = "sha256-gUq6duN7Lo7nC0cp6NG30OYai3q59WtESfaotR9RQIg=";

  postInstall = ''
    mv $out/bin/ghostty_animation $out/bin/ghostty-animation
  '';

  meta = {
    description = "A Command that can show 👻 spinning";
    license = lib.licenses.unlicense;
  };
}
