# Aiono User

This is my personal computer setup

## Usage 

### Secret management
If user requires a secret, you need to put a `secrets.nix` file under the user folder. This file is a Nix set and the keys can be figured out from the nix file.

### Managing Shortcuts
Gnome shortcuts are stored in `dconf`. The shortcuts are declared via `dconf.settings`.

#### Figuring out the dconf path for the shortcut
1. Run `dconf watch /org/gnome/settings-daemon/plugins/media-keys/`
2. Set the shortcut from the GUI
3. The initial command will show you the setting path and value
4. You can convert the output to nix via [dconf2nix](https://github.com/gvolpe/dconf2nix)