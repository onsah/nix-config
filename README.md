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

### Secret management
If user requires a secret, you need to put a `secrets.nix` file under the user folder. This file is a Nix set and the keys can be figured out from the nix file.

### Setting configuration for a user
For `$USER`:
```bash
./scripts/set-user.nu $USER
```
