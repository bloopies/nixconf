{config, pkgs, ...}:
{
  #default shell
  users.defaultUserShell = pkgs.fish;

  #zsh
  programs.fish.enable = true;
}
