{
  pkgs ?
    import
      (fetchTarball "https://github.com/NixOS/nixpkgs/tarball/e381a1288138aceda0ac63db32c7be545b446921")
      { },
}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    nushell
    nixfmt-rfc-style
  ];
}
