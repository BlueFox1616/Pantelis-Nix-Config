{ pkgs, config, ... }: {

  imports = [
    ./modules/bundle.nix
  ];

  home = {
    username = "pantelis";
    homeDirectory = "/home/pantelis";
    stateVersion = "23.11";
  };

  # List of packages, including neofetch
  home.packages = with pkgs; [
    neofetch
  ];

  # Enable GTK
  programs.gtk = {
    enable = true;
  };
}

