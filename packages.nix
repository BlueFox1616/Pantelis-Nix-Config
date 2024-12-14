{ pkgs, inputs, ... }: {  
  # Install firefox.
  programs.firefox.enable = true;
  services.flatpak.enable = true;
  # For localsend to be able to receive files
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];
  # Allow unfree packages
  nixpkgs.config.allowBroken = true;
  services.foldingathome.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs.hyprland.enable = true; # enable Hyprland
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true;
  };# Open ports in the firewall for Steam Local Netwo
  # List packages installed in system profile. 
  environment.systemPackages = with pkgs; [
    #Gui Apps
    pkgs.gnome-tweaks
    pkgs.gnome-software
    pkgs.bottles
    pkgs.libreoffice-qt6-fresh
    pkgs.git
    inputs.zen-browser.packages."${system}".default
    pkgs.localsend
    pkgs.qbittorrent
    pkgs.lutris
    pkgs.stremio
    #Other
    pkgs.imagemagick
    pkgs.whitesur-icon-theme
    pkgs.variety    
    pkgs.python3
    pkgs.python312Packages.requests
    pkgs.gtk4
    pkgs.helvetica-neue-lt-std
    pkgs.aileron
    pkgs.roboto
    pkgs.whitesur-gtk-theme
    pkgs.whitesur-cursors
    pkgs.inotify-tools

    #Gnome Extensions
    pkgs.gnomeExtensions.pip-on-top    
    pkgs.gnomeExtensions.freon
    pkgs.gnomeExtensions.blur-my-shell    
    pkgs.gnomeExtensions.dash2dock-lite
    pkgs.gnomeExtensions.compiz-alike-magic-lamp-effect
    pkgs.gnomeExtensions.compiz-windows-effect
    pkgs.gnomeExtensions.panel-corners
    pkgs.gnomeExtensions.fullscreen-to-empty-workspace
    pkgs.gnomeExtensions.just-perfection
    pkgs.gnomeExtensions.unite
    pkgs.gnomeExtensions.caffeine
    pkgs.gnomeExtensions.battery-time-2
    pkgs.gnomeExtensions.battery-time
    pkgs.gnomeExtensions.dash-to-dock
  ];
}
