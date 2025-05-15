{config, pkgs, ...}:

{
  home.username= "owen";
  home.homeDirectory = "/home/owen";
  #user packages
  home.packages = with pkgs; [
  hello
  ];


  home.stateVersion = "23.11";

  #git
  programs.git = {
    enable = true;
    userName = "bloopies";
    userEmail = "bleebloo22@gmail.com";
  };
  
  #home manager
  programs.home-manager.enable = true;
}
