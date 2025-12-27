# Agent Instructions for Dotfiles Repository

This repository manages Nix-based system configurations for NixOS, macOS (nix-darwin), and WL, plus custom packages and Neovim config.

## Build, Lint, and Test Commands

```bash
# Primary builds (use Makefile targets)
make rebuild           # NixOS main machine: sudo nixos-rebuild switch --flake .#aldrich-main
make darwin            # macOS: sudo darwin-rebuild switch --flake .
make switch-hm          # Home-manager: home-manager switch --flake .#aldrich
make wsl                # WSL: home-manager switch --flake .#wsl

# Testing
make nvim-test          # Test Neovim config (syncs to ~/.config/nvim)
make nvim-clean         # Clean Neovim config before testing
nix flake check         # Validate flake
home-manager build --flake .#aldrich --show-trace  # Test home-manager module
sudo nixos-rebuild test --flake .#aldrich-main     # Test NixOS module safely

# Linting
nixpkgs-fmt .          # Format Nix files
nixpkgs-fmt --check .  # Check Nix formatting
```

## Nix Code Style

- **2-space indentation**, use attribute sets with `inherit` for common variables
- **Pattern**: `{ config, pkgs, inputs, ... }: { ... }`
- **Naming**: modules/packages = `lowercase-with-dashes.nix`, variables = `camelCase`, attributes = `kebab-case`
- **Imports**: Explicit list in `imports = [ ... ]`, use `with pkgs; [ ... ]` for packages
- **Conditionals**: `lib.mkIf`, overrides with `lib.mkForce`, defaults with `lib.mkDefault`
- **Packages**: Use `let` bindings for complex derivations, include `meta` with description/homepage/license/platforms

## Lua Code Style (Neovim)

- **2-space indentation**, use `vim.opt` for options, `vim.keymap.set` for mappings
- **Plugin specs**: Use lazy.nvim pattern with `return { { "author/plugin", config = function() ... end } }`
- **Keys**: Include descriptive `desc` field in keymap tables
- Group plugins in `plugins/specs/` by category (core, lsp, ui, etc.)

## File Organization

- `hosts/`: System-specific configs (darwin/, nixos/)
- `modules/`: Shared modules and configurations
- `home/`: Home-manager configurations (darwin/, nixos/, wsl/)
- `pkgs/`: Custom package definitions
- `overlays/`: Nixpkgs overlays

## Conventions

- **Flake structure**: Organize inputs alphabetically, use `follows` to pin related inputs
- **Commit messages**: Imperative mood, <50 char first line
- **Shell scripts**: Use `#!/usr/bin/env bash`, `set -euo pipefail`, quote variables
- **Makefile**: Tab indentation, `.PHONY` for non-file targets

## Development Workflow

1. Test locally with `make` targets before committing
2. Validate with `nix flake check`
3. Test on target systems when possible
4. Run `nixpkgs-fmt .` to format Nix files

## Security

- Never commit secrets or sensitive data
- Review package sources for trustworthiness
- Use stable package versions when possible

## Troubleshooting

- `nix flake update` - Update outdated flakes
- `sudo nix-collect-garbage -d` - Clear cache issues
- `nix eval --show-trace .#nixosConfigurations.aldrich-main` - Debug evaluation
- Check file paths and imports for errors
