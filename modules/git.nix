# git.nix - Git configuration for NixOS

{ config, pkgs, ... }:

let
  # Define your Git user details here
  gitUserName = "BlueFox1616";
  gitUserEmail = "pantvch@gmail.com";
in {

  # Configure Git
  git = {
    userName = "BlueFox1616";
    userEmail = "pantvch@gmail.com";
  };

  # Enable SSH for GitHub access (ensure the correct SSH key is available)
  programs.ssh = {
    enable = true;
  };

  # Optionally, ensure Git is configured as safe for the repository path
  systemd.services.gitwatch = {
    enable = true;
    path = "/etc/nixos";  # Adjust with the path to your repository
    remote = "git@github.com:BlueFox1616/Pantelis-Nix-Config.git";  # Replace with your repository URL
    user = "root";  # The user to run the service under
  };

}

