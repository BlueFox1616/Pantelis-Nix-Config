{ pkgs, inputs, ... }:  # Import pkgs to access package set

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
      ./modules/bundle.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.auto-optimise-store = true;
  programs.dconf.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Athens";

  # Select internationalisation properties.
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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?

  # Enable SSH and SSH agent
  services.openssh.enable = true;
  
  # Configure your user
  users.users.pantelis = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];  # Modify based on your user setup
    shell = pkgs.zsh;  # Change to your preferred shell if needed
    sshKeys = [
      "/home/pantelis/.ssh/id_rsa.pub" # Path to your public SSH key
    ];
  };

  # Start SSH agent for key management
  programs.ssh.startAgent = true;
}

