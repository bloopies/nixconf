{config, pkgs, ...}:
{
	fileSystems."/mnt/ssd1" = {
		device = "/dev/sdb1/by-uuid/ee0a09d8-2a7a-41f5-b80b-ba1e92b2a943";
		fsType = "exfat";
		options = [
			"users"
			"nofail"
			"x-gvfs-show"
		];
	};
	fileSystems."/mnt/ssd2" = {
		device = "/dev/sda1/by-uuid/44601aff-9f06-4fa4-939e-f4128c5eb9be";
		fsType = "exfat";
		options = [
			"users"
			"nofail"
			"x-gvfs-show"
		];
	};
	fileSystems."/mnt/nvme2" = {
		device = "/dev/nvme0n1p1/by-uuid/7979f744-ba1c-42fe-9cd8-003c620bc5ae";
		fsType = "exfat";
		options = [
			"users"
			"nofail"
			"x-gvfs-show"
		];
	};
}
