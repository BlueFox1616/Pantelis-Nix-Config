{ pkgs, config, ... }: {

  imports = [
    ./bundle.nix
  ];

  home-manager.users.pantelis = {
    homeDirectory = "/home/pantelis";
    stateVersion = "23.11";

    gtk = {
      enable = true;
      theme = {
        name = "WhiteSur";
        package = pkgs.whitesur-gtk-theme;
      };
    };
  };

}

