# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./wm.nix
      ./sh.nix
      ./nvidia.nix
      #./mount.nix
    ];


  # drives

  fileSystems."/mnt/ssd1" = {
  	device = "dev/sda1";
	options = ["nofail"];
  };
  fileSystems."/mnt/ssd2" = {
  	device = "dev/sdb1";
	options = ["nofail"];
  };
  fileSystems."/mnt/nvme2" = {
  	device = "dev/nvme0n1p1";
	#options = ["nofail"];
  };
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme1n1";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  services.getty.autologinUser = "owen";

  #fast shutdown
  systemd.user.extraConfig = "DefaultTimeoutStopSec=10s";
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  }; 

  # sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable=true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable=true;
  };

  #bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  #steam
  programs.steam = {
  	enable = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.owen = {
    isNormalUser = true;
    description = "Owen";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    #shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #allow std binaries
  #programs.nix-ld.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [


  #text/terminal stuff idk
  vscode
  neovim
  kitty
  starship
  neofetch
  stow
  wget
  git
  lf
  ctpv
  unzip
  zathura
  btop
 

  #nix-index

  obsidian
  anki

  #sound/music
  pipewire
  wireplumber
  #termusic
  cmus


  #todo: move to wm.nix?
  rofi-wayland
  waybar
  mako

  #misc
  vesktop
  discord
  firefox
  lutris
  qbittorrent

  #wallpapers and themeing 
  swww
  pywal

  #screenshots
  grim
  slurp
  wl-clipboard
  swappy
  ];  

  fonts.packages = with pkgs; [
  font-awesome
  powerline-fonts
  powerline-symbols
  ];
  
  #services.nginx.enable = true;
  #services.nginx.virtualHosts."localhost" = {
      #addSSL = true;
      #enableACME = true;
      #root = "/blgo/";
  #};
  #security.acme = {
  #  acceptTerms = true;
  #  defaults.email = "bleebloo22@gmail.com";
  #}; 

# Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  #services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

nix = {
  package = pkgs.nixVersions.stable;
  extraOptions = ''
    experimental-features = nix-command flakes
  '';
  };
}
