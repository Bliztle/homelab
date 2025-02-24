{
  description = "Homelab NixOS Flake shared across all homelab devices";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    deploy-rs.url = "github:serokell/deploy-rs";
  };

  outputs = { self, nixpkgs, deploy-rs, ... }@inputs: let
    nodes = [
    {
      hostname = "lenovo.home";
      system = "x86_64-linux";
      role = "server";
    }
    {
      hostname = "pi.home";
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

    deploy.nodes = builtins.listToAttrs (map (node: {
      name = node.hostname;
      value = {
        hostname = node.hostname;
        remoteBuild = true;
        fastConnection = true;
        profile.system = {
          user = "nixos";
          path = deploy-rs.lib.${node.system}.activate.nixos self node.hostname;
        };
      };
    }) nodes);
  };
}
