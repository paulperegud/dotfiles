build:
	docker build -t paulperegud:dotfiles .

test:
	docker run --rm -t -i paulperegud:dotfiles /bin/bash -c "set -x &&             \
		git clone https://github.com/paulperegud/dotfiles.git ~/dotfiles &&          \
		cd ~/dotfiles &&                                                        \
		sed -i 's#git@github.com:#https://github.com/#g' myrepos/.mrconfig &&   \
		./tests/replace-private.sh &&                                           \
		./install.sh &&                                                         \
		. $$HOME/.nix-profile/etc/profile.d/nix.sh &&                           \
		./uninstall.sh"
