{ ... }:

{
  services.thermald.enable = true;
  powerManagement.powertop.enable = true;

  # Reduce timer tick interrupts for better battery life
  boot.kernelParams = [
    "nohz=on"
    "nohz_full=1-19" # This device has 20 cores
  ];
}
