{ meta, ... }:

{
  services.k3s = {
    enable = true;
    role = meta.role;
    token = "INSERT_TOKEN_VALUE";
    clusterInit = meta.hostname == "homelab-lenovo";
    serverAddr = if meta.hostname == "homelab-lenovo" then "" else "homelab-lenovo.home";
    extraFlags = toString [
      "--write-kubeconfig-mode \"644\""
      "--disable servicelb"
      "--disable traefik"
      "--disable local-storage"
    ];
  };
}
