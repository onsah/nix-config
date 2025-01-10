{
  writeTextFile,
  writeShellScriptBin,
  nushell,
}:

let
  name = "shell-with-packages";
in
writeTextFile {
  inherit name;
  executable = true;
  destination = "/bin/${name}";
  text = ''
    #!${nushell}/bin/nu
    ${builtins.readFile ./script.nu}
  '';
  checkPhase = ''
    ${nushell}/bin/nu -c "nu-check $out/bin/${name}"
  '';
}
