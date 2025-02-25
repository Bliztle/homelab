{ ... }:

{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;

    secrets.wg0_pi_public = {};
    secrets.wg0_pi_private = {};
    secrets.wg0_lenovo_public = {};
    secrets.wg0_lenovo_private = {};
    secrets.k3s_token = {};
  };
}
