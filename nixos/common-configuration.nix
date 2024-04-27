# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  outputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./modules/gnome.nix
    #./modules/hyprland.nix
    #./modules/stylix.nix
  ];

  nix.extraOptions = ''
  trusted-users = root aldrich

  extra-substituters = https://nixpkgs-python.cachix.org
  extra-trusted-public-keys = nixpkgs-python.cachix.org-1:hxjI7pFxTyuTHn2NkvWCrAUcNZLNS3ZAvfYNuYifcEU= devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=

  '';

  networking.hostName = "aldrich-host"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Addis_Ababa";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
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

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["FiraCode" "DroidSansMono"];})
    ];

    fontconfig = {
      defaultFonts = {
        monospace = ["Fira Code Nerd Font"];
      };
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aldrich = {
    isNormalUser = true;
    description = "aldrich";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      firefox
      protonvpn-gui
      gtkwave
      #kicad-small
      google-chrome
      steam
      gnome.gnome-tweaks
      transmission-qt
      #spotify
      telegram-desktop
      wezterm
      alacritty

      sublime4

      # lets try installing packages here
      #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
     #outputs.overlays.modifications
  ];

  # Allow insecure packages
  nixpkgs.config.permittedInsecurePackages = [
    # open ssl
    "openssl-1.1.1w"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
    # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    (pkgs.callPackage ../pkgs/apps/dataflare.nix {  })
    pkgs.wget
    pkgs.git
    pkgs.helix
    pkgs.rustup
    pkgs.gcc
    pkgs.kitty

    pkgs.htop

    # for node version manager
    pkgs.volta

    pkgs.motrix

    pkgs.transmission

    #
    pkgs.waybar

    pkgs.eww

    pkgs.dunst

    pkgs.swww

    pkgs.rofi-wayland

    # Golang
    pkgs.go

    pkgs.wl-clipboard

    (let
      base = pkgs.appimageTools.defaultFhsEnvArgs;
    in
      pkgs.buildFHSUserEnv (base
        // {
          name = "fhs";
          targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [pkgs.pkg-config];
          profile = "export FHS=1";
          runScript = "bash";
          extraOutputsToInstall = ["dev"];
        }))
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services.flatpak.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
