{config, pkgs, ...}:
{
	fileSystems."/mnt/ssd1" = {
		device = "/dev/sdb1/";
		options = [
			"nofail"
		];
	};
	fileSystems."/mnt/ssd2" = {
		device = "/dev/sda1/";
		options = [
			"nofail"
		];
	};
	fileSystems."/mnt/nvme2" = {
		device = "/dev/nvme0n1p1/";
		options = [
			"nofail"
		];
	};
}
