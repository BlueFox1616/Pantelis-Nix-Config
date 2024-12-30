{ config, inputs, ... }:

{
  # Enable automatic system upgrades
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # Print build logs
    ];
    dates = "03:00"; # Scheduled time for upgrades
    randomizedDelaySec = "45min"; # Randomized delay to avoid simultaneous updates
  };
}

