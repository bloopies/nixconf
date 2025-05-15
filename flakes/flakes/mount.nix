{config, pkgs, ...}:
{
  fileSystems."/home/owen/drives/nvme2" = {
    device = "UUID=7979f744-ba1c-42fe-9cd8-003c620bc5ae";
    fsType = "ext4";
    options = [ "noatime" "nodiratime" "nofail" ];
  };

  fileSystems."/home/owen/drives/ssd1" = {
    device = "UUID=44601aff-9f06-4fa4-939e-f4128c5eb9be";
    fsType = "ext4";
    options = [ "noatime" "nodiratime" "nofail" ];
  };

  fileSystems."/home/owen/drives/ssd2" = {
    device = "UUID=ee0a09d8-2a7a-41f5-b80b-ba1e92b2a943";
    fsType = "ext4";
    options = [ "noatime" "nodiratime" "nofail" ];
  };
}


