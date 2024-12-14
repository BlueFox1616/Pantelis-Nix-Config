{ config, pkgs, lib, ... }:

{
  # Set the default session for the display manager to "gnome"
  services.displayManager.defaultSession = "gnome";

  # Enable the X11 server (required for GDM and GNOME)
  services.xserver = {
    enable = true;

    # Enable GNOME as the desktop manager
    desktopManager.gnome.enable = true;

    # Enable GDM as the display manager
    displayManager.gdm.enable = true;
  };
}

