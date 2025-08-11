{pkgs, ...}: {
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    shellAliases = {
      ls = "${pkgs.eza}/bin/eza --icons";
      grep = "${pkgs.ripgrep}/bin/rg";
    };
  };
  # programs.zoxide = {
  #   enable = true;
  #   flags = [
  #     "--cmd cd"
  #   ];
  # };
  programs.starship = {
    enable = true;
  };
}
