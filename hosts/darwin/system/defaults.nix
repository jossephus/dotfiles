{
  pkgs,
  self,
  ...
}: {
  system = {
    configurationRevision = self.rev or self.dirtyRev or null;
    primaryUser = "jossephus";
    stateVersion = 6;

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.15;
        show-process-indicators = true;
        show-recents = false;
      };

      finder = {
        _FXShowPosixPathInTitle = false;
        _FXSortFoldersFirst = true;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "clmv";
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      CustomUserPreferences."NSGlobalDomain".TISRomanSwitchState = 1;
      NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;
      controlcenter.Sound = true;
    };
  };

  users.users.jossephus.shell = "${pkgs.bashInteractive}/bin/bash";
  environment.shells = [pkgs.bashInteractive];
  programs.bash.enable = true;

  networking = {
    computerName = "jossephus";
    hostName = "jossephus";
    localHostName = "jossephus";
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };

  security.pam.services.sudo_local = {
    enable = true;
    touchIdAuth = true;
  };
}
