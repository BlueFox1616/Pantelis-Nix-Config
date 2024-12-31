{ lib, fetchFromGitHub, buildGnomeExtension }:

buildGnomeExtension {
  pname = "fildem-gnome-45";
  version = "master"; # or use a valid tag if found

  src = fetchFromGitHub {
    owner = "Sominemo";
    repo = "Fildem-Gnome-45";
    rev = "master"; # or the correct tag name
    sha256 = "sha256-placeholder"; # Update with the correct hash
  };

  meta = with lib; {
    description = "GNOME Shell extension for dynamic panel transparency and workspace switching";
    homepage = "https://github.com/Sominemo/Fildem-Gnome-45";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}

