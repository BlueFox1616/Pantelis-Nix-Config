{ config, pkgs, ... }:

{
  # Ensure Git is installed
  environment.systemPackages = with pkgs; [
    git
  ];

  # Set Git configuration using a wrapper to customize the user name and email
  environment.etc."gitconfig".text = ''
    [user]
      name = BlueFox1616
      email = pantvch@gmail.com
  '';
}

