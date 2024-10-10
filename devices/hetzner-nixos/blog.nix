{ callPackage, fetchFromGitHub }:

let 
  blog-src = fetchFromGitHub {
    owner = "onsah";
    repo = "my-static-site-generator";
    rev = "ddcb9c3888bd0214d584868e6af35a83d8072f4d";
    hash = "sha256-pMmw57v2fgSbhwqcI9nim8qACf9yL9pwLP7xCmqd1F0=";
  };
  blog = callPackage "${blog-src}/build.nix" {};
in
{
  hostName = "blog.aiono.dev";

  root = "${blog}/dist";
}
