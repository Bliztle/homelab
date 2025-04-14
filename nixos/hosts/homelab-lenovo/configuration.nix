{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    # ../../modules/media.nix
    ../../modules/k3s.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.nixos.hashedPassword = "$y$j9T$34zgPEP/8EJQk4h/P3Hqs0$4SF2QpFXOUCkQwwxVyKNwU8lX4QBgc/AzOM4zQZA/5D";

  # Power management
  services.logind = {
    lidSwitch = "ignore";
    lidSwitchDocked = "ignore";
    lidSwitchExternalPower = "ignore";
  };

  # Minimise powerusage in all situations, as performance is of no importance at the moment
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "powersave";
        turbo = "never";
      };
    };
  };
}
