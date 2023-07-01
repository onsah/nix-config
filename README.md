# Nix Config
This repository contains Nix configuration for my devices.

## Prerequisites
* Nix Setup
* Home Manager Setup

## Usage

Enter to the shell
```
nix-shell
```

### Setting configuration for a user
For `$USER`:
```bash
./scripts/set-user.nu $USER
```

## Test Environment
Nested Wayland session doesn't work good enough to test this extension. 
So it's recommended to use a virtual machine to test the extension.

Steps:
1. Create a `Gnome OS` VM via [Gnome Boxes](https://help.gnome.org/users/gnome-boxes/stable/)
2. Make changes to the extension and push to a remote branch
3. Download that branch
4. `gnome-extensions install <extension-name>`
5. Test the extension