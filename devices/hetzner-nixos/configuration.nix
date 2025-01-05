# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./nextcloud.nix
    ./networking.nix
    ./git.nix
    ./readeck.nix
  ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.alice = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     firefox
  #     thunderbird
  #   ];
  # };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Optimise Nix Store
  nix.optimise.automatic = true;

  environment.systemPackages = with pkgs; [ openssl ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  boot.loader.grub.devices = [ "/dev/sda" ];

  # Initial empty root password for easy login:
  users.users.root.initialHashedPassword = "";

  services.openssh = {
    enable = true;
    permitRootLogin = "prohibit-password";
  };

  users.users.root.openssh.authorizedKeys.keys = [
    # Aiono Dell
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCQ+ULM/1XmGlCF/3nsR5P6lS9TKDNn5QblJWxIjBzbkD8L5SVLTAuVEkQ3mDpIa5v/i/M9vwzohUp01yhpODWfFOvDJbvFrbC1nTBEXR+pw5uGvvFpNYgKqk/Zc5vPdXAxooA6dvd4Nw2ja/U7dliBOZ3YcKyw4qddEqKU9FboZdvkkPVrBiXb1Hoph7P8+PD6X98LbzR2asgxoYBWT1Q1kHb8fr1fdfXXOUZWzj8Aj6ydcvnZ/KtZFub/EoSXdzvzC3lp0n7MD49GdQeeu60SzHt9Zti5Ktekz8VsyjjLVhEL5XAh6vumu8dqooBZDLzVTj9ASvqoajXZ6zwJac76/uxxXAl8dGGM6Y0vZj34iX8EOB0N8HPCPZ11dao/zcs7x7HQlyHD8LP5wE5EG/yRVNfKW648q/SM1rKq410lrakvV0eVOEFFlLVfEjlZdNdkUuaA/y0vWe2pPTA0vQe3wbtUKvSA72SO5CCMJ6mj6DA8Ida361ZzQ6i5Nw1eiTk= aiono@aiono-fedora"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPKGxw7ezcdrXsTMtmJkiy28K6nkqkcLkRphNZxMafDB aiono2nixos"
  ];
}
