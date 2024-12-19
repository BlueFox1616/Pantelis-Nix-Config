{ pkgs, ... }: {
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        "logomenu@aryan_k"
        "dash2dock-lite@icedman.github.com"
        "batterytime@typeof.pw"
        "caffeine@patapon.info"
        "freon@UshakovVasilii_Github.yahoo.com"
        "fullscreen-to-empty-workspace@aiono.dev"
        "just-perfection-desktop@just-perfection"
        "panel-corners@aunetx"
        "pip-on-top@rafostar.github.com"
        "unite@hardpixel.eu"
        "blur-my-shell@aunetx"
        "compiz-alike-magic-lamp-effect@hermes83.github.com"
        "compiz-windows-effect@hermes83.github.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "mediacontrols@cliffniff.github.com"
        "pano@elhan.io"
        "rounded-window-corners@fxgn"
        "panel-corners@aunetx"
        "gsconnect@andyholmes.github.io"
        "azwallpaper@azwallpaper.gitlab.com"
      ];
    };
  };
}

