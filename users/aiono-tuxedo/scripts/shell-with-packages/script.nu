
def main [
    --channel: string = "channel:nixos-24.11", # A valid NixOS channel string   
    ...packages: string # packages that will be installed
] {
    nix-shell -I $"($channel)" --expr $"with import <nixpkgs> { }; mkShell { packages = [ ($packages) ]; }"
}
