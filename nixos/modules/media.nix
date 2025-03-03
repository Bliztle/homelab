{ pkgs, ... }:

{
  fileSystems."/mnt/nas/media" = {
    device = "10.0.0.13:/volume1/media";
    fsType = "nfs";
    options = [ "vers=4" "nofail" "_netdev" "x-systemd.automount" "x-systemd.idle-timeout=600" ];
  };

  # services.jellyfin = {
  #   enable = true;
  #   dataDir = "/var/lib/media/jellyfin/data";
  # };
  #
  # services.radarr = {
  #   enable = true;
  #   dataDir = "/var/lib/media/radarr/data";
  # };
  #
  # services.sonarr = {
  #   enable = true;
  #   dataDir = "/var/lib/media/sonarr/data";
  # };
  #
  # services.prowlarr = {
  #   enable = true;
  # };

#   environment.systemPackages = with pkgs; [ nginx ];
#   services.nginx = {
#     enable = true;
#     # config = builtins.readFile ./media.nginx.conf;
#     # recommendedProxySettings = true;
#     # recommendedTlsSettings = true;
#     # logError = "/var/lib/nginx/log debug";
#     logError = "stderr debug";
#     virtualHosts."nginx.homelab" = {
#       listen = [
#       {
#         port = 80;
#         addr = "127.0.0.1";
#       }
#       {
#         port = 80;
#         addr = "[::]";
#       }
#       ];
#       locations."/" = {
#         proxyPass = "http://127.0.0.7:8080";
#         # proxyPass = "http://localhost:8080";
#         extraConfig = ''
#           proxy_pass_header Authorization;
#           proxy_set_header Host $host;
#           proxy_set_header X-Real-IP $remote_addr;
#           proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#           proxy_set_header X-Forwarded-Proto $scheme;
#           proxy_set_header X-Forwarded-Protocol $scheme;
#           proxy_set_header X-Forwarded-Host $http_host;
#         '';
#       };
#     };
#     virtualHosts."jellyfin.homelab" = {
#       listen = [
#       {
#         port = 80;
#         addr = "127.0.0.1";
#       }
#       {
#         port = 80;
#         addr = "[::]";
#       }
#       ];
#       locations."/" = {
#         proxyPass = "http://localhost:8096";
#         extraConfig = ''
#           proxy_pass_header Authorization;
#           proxy_set_header Host $host;
#           proxy_set_header X-Real-IP $remote_addr;
#           proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#           proxy_set_header X-Forwarded-Proto $scheme;
#           proxy_set_header X-Forwarded-Protocol $scheme;
#           proxy_set_header X-Forwarded-Host $http_host;
#         '';
#       };
#       locations."/socket" = {
#         proxyPass = "http://localhost:8096";
#         extraConfig = ''
#           proxy_pass_header Authorization;
#           proxy_http_version 1.1;
#           proxy_set_header Upgrade $http_upgrade;
#           proxy_set_header Connection "upgrade";
#           proxy_set_header Host $host;
#           proxy_set_header X-Real-IP $remote_addr;
#           proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#           proxy_set_header X-Forwarded-Proto $scheme;
#           proxy_set_header X-Forwarded-Protocol $scheme;
#           proxy_set_header X-Forwarded-Host $http_host;
#         '';
#       };
#     };
#   };
#   systemd.tmpfiles.rules = [
#     "d /var/log/nginx 0777 nginx nginx -"
#   ];
}
