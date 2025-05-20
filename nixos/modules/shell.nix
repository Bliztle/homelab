{...}: {
  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
  };
  programs.starship = {
    enable = true;
  };
}
