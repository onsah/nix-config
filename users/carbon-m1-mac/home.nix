{ pkgs, lib, ... }:

{
  imports = [ ../common/programs ./programs ./sleepwatcher ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "onur";
  home.homeDirectory = "/Users/onur";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs;
    let
      fontPackages = [
        (pkgs.nerdfonts.override { fonts = [ "CascadiaCode" "DejaVuSansMono" ]; })
        # I use this for my typst formulas
        pkgs.xits-math
      ];
      myD2 = d2.overrideAttrs (old: {
        src = pkgs.fetchFromGitHub {
          owner = "terrastruct";
          repo = "d2";
          # Temporary use until fixes are being released
          rev = "d09024e22d7119058493e85a335dfbfb26b18a81";
          hash = "sha256-tB7SzUkAvJFW6h/nBKdh1pUz4zGih6+9O7DOs894xU4=";
        };
      });
    in [ gnumake subversion myD2 typst graphviz nil ] ++ fontPackages;

  home.sessionVariables = {
    # Some aws commands need this. It's okay to default to us-east-1 because that's where our alpha infra lies.
    AWS_REGION = "us-east-1";
    # Assume role timeout in carbonhealth-aws
    AWS_ASSUME_ROLE_TTL = "1h";
  };

  home.shellAliases = {
    awsca = "carbonhealth-codeartifact-login carbonhealth-aws";
  };

  # TODO: Filter for specific packages such as vs code
  nixpkgs.config.allowUnfree = true;

  home.file = { ".config/git/config".source = git/config; };

  home.activation = {
    brewBundleHook = let
      brewfile = builtins.toFile "Brewfile" (builtins.readFile brew/Brewfile);
    in lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD /opt/homebrew/bin/brew bundle --file ${brewfile} --no-lock
    '';
    fontsHook =
      let nerdfonts = (pkgs.nerdfonts.override { fonts = [ "CascadiaCode" ]; });
      in lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        # $DRY_RUN_CMD rm -r ~/Library/Fonts/NerdFonts/
        # $DRY_RUN_CMD cp -r ${nerdfonts}/share/fonts/truetype/NerdFonts ~/Library/Fonts/
      '';
  };

  programs.home-manager.enable = true;

  programs.bash = { enable = true; };

  programs.zsh = {
    enable = true;
    initExtra = lib.concatStrings [
      (builtins.readFile zsh/.zshrc)
      (builtins.readFile programs/nnn/ncd.sh)
    ];
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.rtx = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  fonts.fontconfig.enable = true;
}
