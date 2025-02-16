{
  description = "Homelab NixOS Flake shared across all homelab devices";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, disko, ... }@inputs: let
    nodes = [
    {
      hostname = "homelab_lenovo";
      system = "x86_64-linux";
      role = "server";
    }
    {
      hostname = "homelab_pi";
      system = "aarch64-linux";
      role = "agent";
    }
    ];
  in {
    nixosConfigurations = builtins.listToAttrs (map (node: {
      name = node.hostname;
      value = nixpkgs.lib.nixosSystem {
        specialArgs = {
          meta = node;
        };
        system = node.system;
        modules = [
          ./configuration.nix
          ./hosts/${node.hostname}/configuration.nix
        ];
      };
    }) nodes);
  };
}
