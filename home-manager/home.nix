{ pkgs, config, ... }:

{
  imports = [
    ./modules/bundle.nix
  ];

  home = {
    username = "pantelis";
    homeDirectory = "/home/pantelis";
    stateVersion = "23.11";
  };

  home.packages = with pkgs; [
    neofetch
  ];

  # Enable GTK with WhiteSur theme
  programs.gtk.enable = true;
  programs.gtk.theme = {
    name = "WhiteSur";
    package = pkgs.whitesur-gtk-theme;
  };
}

