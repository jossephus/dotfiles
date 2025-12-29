{
  self,
  pkgs,
  rust-overlay,
  zig-overlay,
  ...
}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

  environment.systemPackages = [
    pkgs.vim
    pkgs.bashInteractive
    pkgs.mpv
    pkgs.rust-bin.stable.latest.default
    pkgs.zigpkgs."0.15.2"

    pkgs.rust-analyzer
    pkgs.ripgrep
    pkgs.orbstack
    pkgs.blueutil

    pkgs.antigravity
    pkgs.losslesscut-bin
    #pkgs.autoraisea
  ];

  nix.enable = false;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.substituters = [
    "https://jossephus.cachix.org"
    "https://cache.nixos.org"
  ];
  nix.settings.trusted-public-keys = [
    "jossephus.cachix.org-1:LA2L5W/a8UwH8eWESvKWUKzKILVvCkc3kNgT2AhOIfE="
    "cache.nixos.org-1:6NCHdD59X430o0NTRsW7MSh28tfLlKfIMEgtLvlQF8="
  ];

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # Set default shell to bash
  users.users.jossephus.shell = "${pkgs.bashInteractive}/bin/bash";
  
  # Add nix bash to valid shells
  environment.shells = [ pkgs.bashInteractive ];
  
  # Ensure shell is properly set
  programs.bash.enable = true;

  # Primary user for system-wide settings
  system.primaryUser = "jossephus";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  networking = {
    computerName = "jossephus"; # Shown in System Settings → Sharing
    hostName = "jossephus"; # Used for terminal prompt and Bonjour
    localHostName = "jossephus"; # Used for .local network name
  };

  system.defaults.dock.autohide = true;

  system.defaults.finder = {
    _FXShowPosixPathInTitle = false; # show full path on finder title.
    ShowPathbar = true; # show full path on bottom bar.
    _FXSortFoldersFirst = true; # when sorted, show me folders first, then files.
    FXDefaultSearchScope = "SCcf"; # search should be scoped to the current directory, ffs
    FXPreferredViewStyle = "clmv"; 
    QuitMenuItem = true; # apparently, finder can be quit lol
    ShowStatusBar = true;
  };

  security.pam.services.sudo_local = {
    enable = true; 
    touchIdAuth = true;
  };

  #system.defaults.NSGlobalDomain._HIHideMenuBar = false;
}
