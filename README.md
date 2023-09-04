# Nix Config
This repository contains Nix configuration for my devices.

## Prerequisites
* Nix Setup
* Home Manager Setup

## Project File Structure
```
.
├── scripts
├── hooks
└── users/
    ├── common/
    │   └── programs
    └── $user/
        ├── programs
        └── home.nix
```
* `scripts`: Scripts to execute configurations.
* `hooks`: Git hooks.
* `users`: List of user configs.
  * `$user`
    * `home.nix`: [Home Manager](https://nix-community.github.io/home-manager/) entry to the configuration.
    * `programs`: Program configurations.
  * `common`: Configurations used accross users
    * `programs`: Program configurations.

## Setup
You need to run setup for one time setup. It's needed for git hooks etc.

In [nix shell](#entering-to-nix-shell), run `./scripts/setup.nu`.

### Entering to `nix-shell`
```bash
nix-shell
```

## Usage
You need to run scripts etc. from nix shell:
```
nix-shell
```

### Setting configuration for a user
For `$USER`, run:
```bash
./scripts/set-user.nu $USER
```

## Formatting
In [nix shell](#entering-to-nix-shell), run `format`.
