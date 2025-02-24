{ ... }:

{
  services.jellyfin = {
    enable = true;
    datadir = /var/lib/media/jellyfin/data;
  };

  services.radarr = {
    enable = true;
    datadir = /var/lib/media/radarr/data;
  };

  services.sonarr = {
    enable = true;
    dataDir = /var/lib/media/sonarr/data;
  };

  services.prowlarr = {
    enable = true;
  };
}
