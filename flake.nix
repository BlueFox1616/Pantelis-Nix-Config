{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nixcord.url = "github:kaylorben/nixcord";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    gitwatch.url = "github:gitwatch/gitwatch";  # Add this line for Gitwatch
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, gitwatch, ... }@inputs:

  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    fildem-extension = pkgs.callPackage ./FildemExtension.nix {inherit (pkgs) lib fetchFromGitHub buildGnomeExtension};
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };

      modules = [
        ./configuration.nix
        inputs.spicetify-nix.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.pantelis = import ./home-manager/home.nix;

          home-manager.sharedModules = [
            inputs.nixcord.homeManagerModules.nixcord
          ];

          # Add Fildem GNOME Extension
          programs.gnome.extensions = {
            enable = true;
            extensions = [ fildem-extension ];
          };
        }

        # Enable gitwatch as a service
        {
          services.gitwatch.my-service-name = {
            enable = true;
            path = "/etc/nixos";  # Adjust the path as needed
            remote = "git@github.com:BlueFox1616/Pantelis-Nix-Config";  # Adjust with your repository URL
            user = "pantelis";  # The user to run the service under
            branch = "main";
          };
        }
      ];
    };
  };
}

