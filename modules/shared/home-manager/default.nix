# Toggle between two home-manager configuration approaches:
# - nixified: Full Nix-based configuration
# - sources: Static dotfiles with minimal Nix wrapping

{inputs, ...}: {
  imports = [
    # ./nixified
    ./sources 
  ];
}
