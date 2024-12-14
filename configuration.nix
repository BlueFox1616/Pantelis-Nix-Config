{ pkgs, ... }:  # Import pkgs and inputs for usage

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
      ./modules/bundle.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.auto-optimise-store = true;
  programs.dconf.enable = true;

  # Networking
  networking.hostName = "nixos"; # Define your hostname
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  # Timezone and Locale settings
  time.timeZone = "Europe/Athens";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "el_GR.UTF-8";
    LC_IDENTIFICATION = "el_GR.UTF-8";
    LC_MEASUREMENT = "el_GR.UTF-8";
    LC_MONETARY = "el_GR.UTF-8";
    LC_NAME = "el_GR.UTF-8";
    LC_NUMERIC = "el_GR.UTF-8";
    LC_PAPER = "el_GR.UTF-8";
    LC_TELEPHONE = "el_GR.UTF-8";
    LC_TIME = "el_GR.UTF-8";
  };

  # Enable printing services
  services.printing.enable = true;

  system.stateVersion = "24.05";  # Ensure compatibility with your system setup

  # Enable SSH and SSH agent
  services.openssh.enable = true;

  # Configure the user with the proper shell
  users.users.pantelis = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];  # Modify groups based on your user setup
    shell = pkgs.zsh;  # Modify to your preferred shell if needed
  };

  # Configure SSH with the correct public/private keys
  programs.ssh = {
    startAgent = true;
    extraConfig = ''
      IdentityFile /home/pantelis/.ssh/id_rsa  # Specify the private key
    '';
    authorizedKeys = [ "/home/pantelis/.ssh/id_rsa.pub" ];  # Add your public key here
  };

  # Import inputs for any external modules or packages
  inputs = {
    # Example: You could include flake inputs here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    # Other external inputs can be added as needed
  };
}

