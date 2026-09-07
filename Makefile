ACTIVE := mpv nsxiv zsh tmux hypr kitty waybar xdg-desktop-portal swaync rofi scripts neovim fastfetch

all:
	stow --verbose --restow $(ACTIVE)

clean:
	stow --verbose --delete $(ACTIVE)
