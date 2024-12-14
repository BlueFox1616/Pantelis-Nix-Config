{ pkgs, inputs, ... }:  # inputs are accessed from the function arguments

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      beautifulLyrics
      shuffle # shuffle+ (special characters sanitized)
    ];
    theme = spicePkgs.themes.lucid;
  };
}

