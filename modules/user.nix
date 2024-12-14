{ pkgs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pantelis = {
    isNormalUser = true;
    description = "Pantelis";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # thunderbird
    ];
  };
}
