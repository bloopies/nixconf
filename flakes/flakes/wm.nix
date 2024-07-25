{config, pkgs, ...}:
{
#services.xserver = {
#  enable = true;
#
#  desktopManager = {
#    xterm.enable = false;
#  };
#	
#  displayManager = {
#    defaultSession = "none+i3";
#  };
#
  #i3
#  windowManager.i3 = {
#    enable = true;
#   };
#  };
programs.hyprland = {
	enable = true;
	xwayland.enable = true;
};
}
