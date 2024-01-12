
switch-hm:
    home-manager switch --flake ~/.config/nixos-config/

switch-os:
    sudo nixos-rebuild switch --flake ~/.config/nixos-config#nixos-test

activate-hm:
    nix build --no-link ~/.config/nixos-config#homeConfigurations.aldrich.activationPackage
    "$(nix path-info ~/.config/nixos-config#homeConfigurations.aldrich.activationPackage)"/activate
