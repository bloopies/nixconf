{

  description = "flake";

  inputs = {
    nixpkgs.url = "nixpkgs/24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #ags
    #ags.url = "github:Aylur/ags";
  };


  outputs = {self,nixpkgs,home-manager, ...}:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
      inherit system;
      modules = [
      ./configuration.nix 
      home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;

	  home-manager.users.owen = import ./home.nix;
        }
      ];
      };
    };
    homeConfigurations = {
      owen = home-manager.lib.homeManagerConfiguration{
       inherit pkgs;
        modules = [./home.nix];
	programs.home-manager.enable = true;
      }; 
    };
  };

}
