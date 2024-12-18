{ pkgs, config, ... }:

{
  home = {
    username = "pantelis";
    homeDirectory = "/home/pantelis";
    stateVersion = "23.11";

    packages = with pkgs; [
      neofetch
    ];

    };
  };
}

