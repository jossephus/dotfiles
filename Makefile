darwin:
	sudo darwin-rebuild switch --flake .

wsl: 
	home-manager switch --flake .#wsl --verbose 

rebuild:
	sudo nixos-rebuild switch --flake .#aldrich-main -L

switch-hm:
	home-manager switch --flake .#aldrich

activate-hm:
	nix build --no-link .#homeConfigurations.aldrich.activationPackage
	"$(nix path-info .#homeConfigurations.aldrich.activationPackage)"/activate

list-gen:
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 2d


nvim-clean:
	rm -rvf ${HOME}/.config/nvim/

nvim-test: nvim-clean 
	rsync -avz --copy-links --chmod=D2755,F744 /home/aldrich/.config/nixos-config/home/modules/nvim/config/ ${HOME}/.config/nvim/

