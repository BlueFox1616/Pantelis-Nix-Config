{ pkgs, inputs, ... }: {
  # Install firefox.
  programs.firefox.enable = true;
  services.flatpak.enable = true;
  # For localsend to be able to receive files
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];

  # Allow TCP/UDP port ranges for KDE Connect
  networking.firewall.allowedTCPPortRanges = [
    { from = 1714; to = 1764; }
  ];
  networking.firewall.allowedUDPPortRanges = [
    { from = 1714; to = 1764; }
  ];

  # Allow unfree packages
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnfree = true;
  zramSwap.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true;
  };

  # List packages installed in system profile. 
  environment.systemPackages = with pkgs; [
    # Gui Apps
    pkgs.gnome-tweaks
    pkgs.gnome-software
    pkgs.bottles
    pkgs.libreoffice-qt6-fresh
    pkgs.git
    inputs.zen-browser.packages."${system}"
    pkgs.localsend
    pkgs.qbittorrent
    pkgs.lutris
    pkgs.stremio
    pkgs.gradience
    pkgs.gearlever
    pkgs.obsidian
    # Other
    pkgs.imagemagick
    pkgs.whitesur-icon-theme    
    pkgs.python3
    pkgs.python312Packages.requests
    pkgs.gtk4
    pkgs.helvetica-neue-lt-std
    pkgs.aileron
    pkgs.roboto
    pkgs.whitesur-gtk-theme
    pkgs.whitesur-cursors
    pkgs.inotify-tools
    pkgs.fastfetch
    pkgs.btop
    # Integrating Geist Mono font directly from nerd-fonts
    pkgs.nerd-fonts.geist-mono
    # Gnome Extensions
    pkgs.gnomeExtensions.pip-on-top    
    pkgs.gnomeExtensions.freon
    pkgs.gnomeExtensions.blur-my-shell    
    pkgs.gnomeExtensions.dash2dock-lite
    pkgs.gnomeExtensions.compiz-alike-magic-lamp-effect
    pkgs.gnomeExtensions.compiz-windows-effect
    pkgs.gnomeExtensions.fullscreen-to-empty-workspace
    pkgs.gnomeExtensions.logo-menu
    pkgs.gnomeExtensions.just-perfection
    pkgs.gnomeExtensions.unite
    pkgs.gnomeExtensions.caffeine
    pkgs.gnomeExtensions.battery-time
    pkgs.gnomeExtensions.pano
    pkgs.gnomeExtensions.media-controls
    pkgs.gnomeExtensions.rounded-window-corners-reborn
    pkgs.gnomeExtensions.panel-corners
    pkgs.gnomeExtensions.gsconnect
    pkgs.gnomeExtensions.wallpaper-slideshow
    pkgs.gnomeExtensions.bluetooth-battery-meter
  ];
}

