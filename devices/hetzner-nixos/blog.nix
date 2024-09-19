{ callPackage, fetchFromGitHub }:

let 
  blog-src = fetchFromGitHub {
    owner = "onsah";
    repo = "my-static-site-generator";
    rev = "528580daf0a428f52737c472c93f35f6cf378c1a";
    hash = "sha256-7swoYB8Q1e+8EjOw0Jmch6II99q4dIESiFxJzRY5P2E=";
  };
  blog = callPackage "${blog-src}/build.nix" {};
in
{
  hostName = "blog.aiono.dev";

  root = "${blog}/dist";
}
