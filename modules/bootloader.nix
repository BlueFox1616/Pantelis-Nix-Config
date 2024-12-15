{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  systemd-boot = {
    enable = true;
    configurationLimit = 5;
    editor = false;
  };
}

