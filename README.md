# Nix Config
This repository contains Nix configuration for my devices.

## Prerequisites
* [Nix Package Manager](https://nixos.wiki/wiki/Nix_Installation_Guide)
* [Home Manager Setup](https://nix-community.github.io/home-manager/index.html#ch-installation)
* [direnv](https://direnv.net/docs/installation.html)

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

#### For the first time (Before setting up the user)

Run `nix-shell` in the root of the project.

#### After you have set your user
1. `cd` into the project root.
2. For one time, execute `direnv allow`

After enabling `direnv` once, it will automatically enter to the `nix-shell` whenever you `cd` into the directory.

## Usage

### Prerequisites
* [nix shell](#entering-to-nix-shell)

### Setting device configuration
Use `rebuild` script to set NIXOS configuration.
It uses the pinned channel in the repository root.

Example:
```shell
build-device devices/tuxedo-infinitybook-gen8/
```

### Setting user configuration

You need to have `home-manager` available in the environment for the first setup. You can have it using the following command:
```bash
NIX_PATH=home-manager=https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz:nixpkgs=channel:nixos-24.05 nix-shell '<home-manager>' -A install
```

Example:
```bash
build-user users/aiono-tuxedo
```

### Formatting
`format-nix-staged`

You don't need to do it manually as it runs automatically pre commit after [setup](#setup).

### Cleaning up the Nix Store
Unfortunately Nix Store accumulates garbage as it's being used, so occasionally one needs to cleanup the store. For now there is a script for it: `cleanup-nix-store`.

### Upgrading NixOS version

Update npins channel

```shell
npins -d devices/$DEVICE_NAME add --name nixpkgs channel $CHANNEL_NAME
```

### Upgrading Home Manager version

Update npins channels

```shell
npins -d users/aiono-tuxedo/npins add github nix-community home-manager --branch release-$VERSION
npins -d users/aiono-tuxedo/npins add github nixos nixpkgs --branch nixos-$VERSION
```

