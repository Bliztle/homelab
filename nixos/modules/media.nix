{ ... }:

{
  services.jellyfin = {
    enable = true;
    dataDir = "/var/lib/media/jellyfin/data";
  };

  services.radarr = {
    enable = true;
    dataDir = "/var/lib/media/radarr/data";
  };

  services.sonarr = {
    enable = true;
    dataDir = "/var/lib/media/sonarr/data";
  };

  services.prowlarr = {
    enable = true;
  };
}
