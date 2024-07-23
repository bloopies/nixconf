{ configs, pkgs, ... }:
{
	options = {
	};

	config{
		boot.kernelParams = ["nvidia_drm.fbdev=1" "nvidia-drm.modeset=1" "module_blacklist=i1915" ];

		hardware.opengl = {
			enable = true;
			driSupport = true;
			driSupport32Bit = true;
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
			];
		hardware.nvidia = {
			forceFullCompositionPipeline = true;
			modesetting.enable = true;
			powerManagement.enable = true;
			powerManagement.finegrained = false;
			open = false;
			nvidiaSettings = true;
			};
		hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
			version = "555.58";
			sha256_64bit = "sha256-bXvcXkg2kQZuCNKRZM5QoTaTjF4l2TtrsKUvyicj5ew=";
			sha256_aarch64 = "sha256-7XswQwW1iFP4ji5mbRQ6PVEhD4SGWpjUJe1o8zoXYRE=";
			openSha256 = "sha256-hEAmFISMuXm8tbsrB+WiUcEFuSGRNZ37aKWvf0WJ2/c=";
			settingsSha256 = "sha256vWnrXlBCb3K5uVkDFmJDVq51wrCoqgPF03lsjZ0uU8M=";
			persistencedSha256 = "sha256-lyYxDuGDTMdGxX3CaiWUh1IQuQlkI2hPEs5LI20vEVw=";
			};
		hardware.opengl.driSUpport = true;
		services.xserver.videoDrivers = [ "nvidia" ];
	};
}

