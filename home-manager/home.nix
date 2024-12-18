{ pkgs, config, ... }:

{
  home = {
    username = "pantelis";
    homeDirectory = "/home/pantelis";
    stateVersion = "23.11";

    # Import the bundle.nix
    imports = [
      ./modules/bundle.nix
    ];

    packages = with pkgs; [
      neofetch
    ];
  };
}

