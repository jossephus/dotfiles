{ self, pkgs, rust-overlay, ... }: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  
  nixpkgs.overlays = [ rust-overlay.overlays.default ];
  
  environment.systemPackages =
    [ 
      pkgs.vim
      pkgs.bashInteractive
      pkgs.mpv
      pkgs.rust-bin.stable.latest.default
      pkgs.ripgrep
      pkgs.orbstack
    ];

  nix.enable = false;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # Set default shell to bash
  users.users.jossephus.shell = pkgs.bash;

  # Primary user for system-wide settings
  system.primaryUser = "jossephus";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  networking = {
    computerName = "jossephus";    # Shown in System Settings → Sharing
    hostName = "jossephus";        # Used for terminal prompt and Bonjour
    localHostName = "jossephus";   # Used for .local network name
  };

  system.defaults.dock.autohide = true;
  #system.defaults.NSGlobalDomain._HIHideMenuBar = false;

}
