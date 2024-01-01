{config, pkgs, ...}:
{
#services.xserver = {
#  enable = true;
#
#  displayManager = {
#    sddm.enable = true;
#    #defaultSession = "none+awesome";
#  };
#  #awesome
#  windowManager.awesome = {
#    enable = true;
#    luaModules = with pkgs.luaPackages; [
#      luarocks
#      luadbi-mysql
#    ];
#   };
#  };
programs.hyprland.enable = true;
}
