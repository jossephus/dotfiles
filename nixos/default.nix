{ pkg, ... }: {
  imports = [
    ./configuration.nix
  ];

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ] })
    ];

    fontConfig = {
      defaultFonts = {
          monospace = [ "Fira Code Nerd Font" ];
      };
    };
  };
}
