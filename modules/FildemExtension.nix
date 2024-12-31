{ lib, fetchFromGitHub, buildGnomeExtension }:

buildGnomeExtension {
  pname = "fildem-gnome-45";
  version = "2.2.0"; # Update this to the desired version

  src = fetchFromGitHub {
    owner = "Sominemo";
    repo = "Fildem-Gnome-45";
    rev = "v2.2.0"; # Match the version tag
    sha256 = "sha256-placeholder"; # Replace with actual hash
  };

  meta = with lib; {
    description = "GNOME Shell extension for dynamic panel transparency and workspace switching";
    homepage = "https://github.com/Sominemo/Fildem-Gnome-45";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ yourName ];
    platforms = platforms.linux;
  };
}

