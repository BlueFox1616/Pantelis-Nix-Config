{ pkgs, config, ... }: {

  imports = [
    ./home.nix
  ];

  home-manager.users.pantelis = {
    homeDirectory = "/home/pantelis";
    stateVersion = "23.11";

    packages = with pkgs; [
      neofetch
      # Add any other packages here if needed
    ];

    gtk = {
      enable = true;
      theme = {
        name = "WhiteSur";
        package = pkgs.whitesur-gtk-theme;
      };
    };
  };

  # If you have other users, you can define them here similarly
  home-manager.users.pantelis = {
    homeDirectory = "/home/pantelis";
    stateVersion = "23.11";

    packages = with pkgs; [
      neofetch
      # Add any other packages here if needed
    ];

    gtk = {
      enable = true;
      theme = {
        name = "WhiteSur";
        package = pkgs.whitesur-gtk-theme;
      };
    };
  };

}

