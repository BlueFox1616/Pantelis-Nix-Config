{
  pkgs,
  lib,
  ...
}:

{
  gtk = {
    enable = true;

    cursorTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-cursors;
      size = 32;
    };

    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };

    theme = {
      name = "WhiteSur-Dark";
    };
  };

  qt = {
    enable = true;

    platformTheme.name = "qt5ct";

    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=WhiteSurDark
    '';

    "Kvantum/WhiteSur".source = "${pkgs.whitesur-kde}/share/Kvantum/WhiteSur";
  };

  home.activation = {
    installThemes = lib.hm.dag.entryAfter [ "writeBoundary" "installPackages" "git" ] ''
      ${pkgs.git}/bin/git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git 

      theme_dir="$HOME/WhiteSur-gtk-theme"
      install_script="$theme_dir/install.sh"

      if [ -f "$install_script" ]; then
        echo "Attempting to install WhiteSur GTK Theme..."

        chmod +x "$install_script"
        export PATH=${pkgs.sassc}/bin:${pkgs.which}/bin:${pkgs.getent}/bin:${pkgs.util-linux}/bin:${pkgs.glib.dev}/bin:${pkgs.libxml2.bin}/bin:${pkgs.sudo}/bin:$PATH
        cd "$theme_dir"
        ${pkgs.bash}/bin/bash -c "bash $install_script -l" 
        rm -rf "$theme_dir"
      else
        echo "Theme installation script not found at $install_script"
      fi
    '';
  };
}

