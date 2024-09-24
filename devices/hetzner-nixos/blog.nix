{ callPackage, fetchFromGitHub }:

let 
  blog-src = fetchFromGitHub {
    owner = "onsah";
    repo = "my-static-site-generator";
    rev = "902fbafbc0647629a71879f329d614206a515ff0";
    hash = "sha256-460AnlYCU7g9/ZtfYc2j6hLF17+lEZJl75kCDjbTl9s=";
  };
  blog = callPackage "${blog-src}/build.nix" {};
in
{
  hostName = "blog.aiono.dev";

  root = "${blog}/dist";
}
