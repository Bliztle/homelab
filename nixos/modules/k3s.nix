{
  meta,
  lib,
  config,
  ...
}: let
  isServer = meta.role == "server";
in
  lib.mkIf config.custom.k3s {
    services.k3s = {
      enable = true;
      role = meta.role;
      tokenFile = "/run/secrets/k3s_token";
      clusterInit = meta.hostname == "homelab-lenovo";
      serverAddr =
        if meta.hostname == "homelab-lenovo"
        then ""
        else "https://10.0.0.7:6443";
      extraFlags = toString ([
          "--disable servicelb"
          "--disable traefik"
          "--disable local-storage"
        ]
        ++ (
          if isServer
          then [
            "--write-kubeconfig-mode \"0644\""
          ]
          else []
        ));
    };

    # Services required for Longhorn manager pods to work
    services.openiscsi = {
      enable = true;
      name = "iqn.2016-04.com.open-iscsi:${meta.hostname}";
    };
    programs.nix-ld.enable = true; # Allow dynamic linking of nix packages
    systemd.tmpfiles.rules = [
      # This is a fix for not finding iscsiadm
      "L+ /usr/local/bin - - - - /run/current-system/sw/bin/"
    ];
  }
