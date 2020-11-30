{...}:
{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/sda";

  boot.initrd.checkJournalingFS = false;
  security.rngd.enable = false; # otherwise vm will not boot
}
