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
}

