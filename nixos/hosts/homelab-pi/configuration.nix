{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/wireguard.nix
    # ../../modules/media.nix
    # ../../modules/k3s
  ];

  # Use the extlinux boot loader. (NixOS wants to enable GRUB by default)
  boot.loader.grub.enable = false;
  # Enables the generation of /boot/extlinux/extlinux.conf
  boot.loader.generic-extlinux-compatible.enable = true;

  users.users.nixos.hashedPassword = "$y$j9T$kdsgkfbxh5jBakV5fSJ/x.$lax1VHF9rrQ9vXmv6zXL2BhO1zCouS3rI6ShjhHGmxC";
}

