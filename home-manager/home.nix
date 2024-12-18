{ pkgs, config, ... }:

{
  imports = [
    ./modules/bundle.nix
  ];

  home = {
    username = "pantelis";
    homeDirectory = "/home/pantelis";
    stateVersion = "23.11";

    packages = with pkgs; [
      neofetch
    ];

    gtk = {
      enable = true;
      theme = {
        name = "WhiteSur-dark";
        package = pkgs.whitesur-gtk-theme;
      };
      iconTheme = {
        name = "WhiteSur";
        package = pkgs.whitesur-icon-theme;
      };
    };
  };
}

