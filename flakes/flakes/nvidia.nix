{ config, pkgs, ... }:
{	
	options = {};
	config = {
		boot.kernelParams = [ "nvidia_drm.fbdev=1" "nvidia-drm.modeset=1" "nvidia.NVreg_PreserveVideoMemoryAllocations=1"];
		hardware.opengl = {
			enable = true;
			};
		services.xserver.videoDrivers = ["nvidia"];

		environment.variables = {
			NIXOS_OZONE_WL = "1";
		};

		hardware.nvidia = {
			forceFullCompositionPipeline = true;
			modesetting.enable = true;
			powerManagement.enable = false;
			powerManagement.finegrained = false;
			open = false;
			nvidiaSettings = true;
			package = config.boot.kernelPackages.nvidiaPackages.beta;
			#package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    			#	version = "555.58";
    			#	sha256_64bit = "sha256-bXvcXkg2kQZuCNKRZM5QoTaTjF4l2TtrsKUvyicj5ew=";
    			#	sha256_aarch64 = "sha256-7XswQwW1iFP4ji5mbRQ6PVEhD4SGWpjUJe1o8zoXYRE=";
    			#	openSha256 = "sha256-hEAmFISMuXm8tbsrB+WiUcEFuSGRNZ37aKWvf0WJ2/c=";
    			#	settingsSha256 = "sha256-vWnrXlBCb3K5uVkDFmJDVq51wrCoqgPF03lSjZOuU8M=";
    			#	persistencedSha256 = "sha256-lyYxDuGDTMdGxX3CaiWUh1IQuQlkI2hPEs5LI20vEVw=";
			#	};
			};

		

		environment.systemPackages = with pkgs; [
			libva-utils
			vdpauinfo
			vulkan-tools
			vulkan-validation-layers
			libvdpau-va-gl
			egl-wayland
			wgpu-utils
			mesa
			libglvnd
			nvtop
			nvitop
			libGL
			gnome.gdm
		];
	};
}

