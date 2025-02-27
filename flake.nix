{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        # pkgs = (import (inputs.nixpkgs) { inherit system; });
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          overlays = [
            (final: prev: rec {
              kubernetes-helm-wrapped = prev.wrapHelm prev.kubernetes-helm {
                plugins = with prev.kubernetes-helmPlugins; [
                  helm-diff
                  helm-secrets
                  helm-s3
                ];
              };
            })
          ];
        };
      in {
        # Shell dependencies
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            deploy-rs
            # (wrapHelm kubernetes-helm {
            #   plugins = with pkgs.kubernetes-helmPlugins; [
            #     helm-secrets
            #     helm-diff
            #     helm-s3
            #     helm-git
            #   ];
            # }) 
            # helmfile
            kubernetes-helm-wrapped
            helmfile-wrapped
            kustomize
          ];
        };
      }
    );
}
