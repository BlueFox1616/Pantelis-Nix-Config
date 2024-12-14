{ config, pkgs, ... }: {
  # Configure the git user with a restricted shell and home directory
  users.users.git = {
    isSystemUser = true;  # Create the git user as a system user
    group = "git";        # Assign to git group
    home = "/var/lib/git-server";  # Path to store git repositories
    createHome = true;    # Create home directory if it doesn't exist
    shell = "${pkgs.git}/bin/git-shell";  # Set the login shell to git-shell
    openssh.authorizedKeys.keys = [
      # SSH public keys of authorized users
      "SHA256:hdUur7HF5CmucJBX7+4HtANpElAKpjkzqgpabSIfLjQ"
    ];
  };

  # Create the git group if it doesn't exist
  users.groups.git = {};

  # Enable SSH service and set restrictions for the git user
  services.openssh = {
    enable = true;
    extraConfig = ''
      Match user git
        AllowTcpForwarding no
        AllowAgentForwarding no
        PasswordAuthentication no
        PermitTTY no
        X11Forwarding no
    '';
  };
}

