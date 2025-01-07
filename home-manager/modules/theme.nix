{ pkgs, lib, ... }:

{
  gtk = {
    enable = true;

    cursorTheme = {
      name = "WhiteSur-cursors";
      package = pkgs.whitesur-cursors;
      size = 24;
    };

    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };

    theme = {
      name = "WhiteSur-Dark";
    };
  };

  home.activation = {
    installThemes = lib.hm.dag.entryAfter [ "writeBoundary" "installPackages" "git" ] ''
      theme_dir="$HOME/WhiteSur-gtk-theme"
      repo_url="https://github.com/vinceliuice/WhiteSur-gtk-theme.git"

      # Ensure the directory does not already exist
      if [ -d "$theme_dir" ]; then
        echo "Removing existing WhiteSur-gtk-theme directory..."
        rm -rf "$theme_dir"
      fi

      # Clone the repository
      echo "Cloning WhiteSur GTK Theme repository..."
      ${pkgs.git}/bin/git clone "$repo_url" "$theme_dir"

      # Define the installation script path
      install_script="$theme_dir/install.sh"

      if [ -f "$install_script" ]; then
        echo "Installing WhiteSur GTK Theme..."
        chmod +x "$install_script"

        # Add required tools to PATH
        export PATH=${pkgs.sassc}/bin:${pkgs.which}/bin:${pkgs.getent}/bin:${pkgs.util-linux}/bin:${pkgs.glib.dev}/bin:${pkgs.libxml2.bin}/bin:${pkgs.sudo}/bin:$PATH

        # Run the installation script
        cd "$theme_dir"
        ${pkgs.bash}/bin/bash -c "./install.sh -l"

        # Clean up by removing the directory
        echo "Removing WhiteSur-gtk-theme directory after installation..."
        rm -rf "$theme_dir"
      else
        echo "Installation script not found at $install_script"
      fi
    '';
  };
}

