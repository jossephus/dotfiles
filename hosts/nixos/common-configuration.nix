{pkgs, ...}: {
  imports = [./modules/gnome.nix];

  networking = {
    hostName = "aldrich-host";
    networkmanager.enable = true;
  };

  time.timeZone = "Africa/Addis_Ababa";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "am_ET";
      LC_IDENTIFICATION = "am_ET";
      LC_MEASUREMENT = "am_ET";
      LC_MONETARY = "am_ET";
      LC_NAME = "am_ET";
      LC_NUMERIC = "am_ET";
      LC_PAPER = "am_ET";
      LC_TELEPHONE = "am_ET";
      LC_TIME = "am_ET";
    };
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.droid-sans-mono
      nerd-fonts.fira-code
    ];
    fontconfig.defaultFonts.monospace = ["Fira Code Nerd Font"];
  };

  services = {
    flatpak.enable = true;
    printing.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
  security.rtkit.enable = true;

  users.users.aldrich = {
    isNormalUser = true;
    description = "aldrich";
    shell = pkgs.bashInteractive;
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      alacritty
      firefox
      gnome-tweaks
      google-chrome
      gtkwave
      hunspell
      hunspellDicts.uk_UA
      libreoffice-qt
      protonvpn-gui
      steam
      telegram-desktop
      transmission_4-qt
      karere
      wezterm
    ];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    extra-substituters = [ "https://cache.jossephus.et/jossephus" ];
    extra-trusted-public-keys = [ "jossephus:iG2HsPZsVgIJtR6OMLRM4XXoBRJ/NTvYTT0lIcssJ74=" ];
  };

  systemd.settings.Manager.DefaultLimitNOFILE = 1048576;
  systemd.user.settings.Manager.DefaultLimitNOFILE = 1048576;

  environment.systemPackages = with pkgs; [
    dunst
    eww
    gcc
    git
    htop
    lutris
    motrix
    rofi
    rustup
    swww
    transmission_4
    unrar
    unzip
    volta
    waybar
    wget
    wl-clipboard
    zed-editor
    zip
  ];

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  system.stateVersion = "23.11";
}
