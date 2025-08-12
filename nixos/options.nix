{lib, ...}: {
  options.custom = {
    laptop = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Is this a laptop system? If so, we need to enable battery and lid features.";
    };
    k3s = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether to enable k3s (Kuburnetes) on this system. Note that this option cannot be enabled for initial deployment, as it requires sops secrets to already exist.";
    };
  };
}
