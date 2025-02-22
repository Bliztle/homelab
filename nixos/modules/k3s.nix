{ meta, ... }:
let
  isServer = meta.role == "server";
in
{
  services.k3s = {
    enable = true;
    role = meta.role;
    tokenFile = "/var/lib/homelab/k3s/token";
    clusterInit = meta.hostname == "homelab-lenovo";
    serverAddr = if meta.hostname == "homelab-lenovo" then "" else "https://10.0.0.7:6443";
    extraFlags = toString ([ 

    ] ++ (if isServer then [
      "--write-kubeconfig-mode \"0644\""
    ] else []));
  };
}
