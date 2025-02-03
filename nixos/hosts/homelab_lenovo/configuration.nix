{ meta, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.nixos.hashedPassword = "$y$j9T$34zgPEP/8EJQk4h/P3Hqs0$4SF2QpFXOUCkQwwxVyKNwU8lX4QBgc/AzOM4zQZA/5D";
}
