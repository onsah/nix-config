# Nix Config
This repository contains Nix configuration for my devices.

## Prerequisites
* Nix Setup
* Home Manager Setup
* Direnv

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
Prerequisites:
* `direnv` with `nix-direnv` enabled. 

Run `direnv allow` to enter to the `nix-shell`.

#### After you have set your user
1. `cd` into the project root.
2. For one time, execute `direnv allow`

After enabling `direnv` once, it will automatically enter to the `nix-shell` whenever you `cd` into the directory.

## Usage

### Prerequisites
* [nix shell](#entering-to-nix-shell)

### Setting configuration for a user
For `$USER`, run:
```bash
set-user $USER
```

### Formatting
`format`

You don't need to do it manually as it runs automatically pre commit after [setup](#setup).

### Cleaning up the Nix Store
Unfortunately Nix Store accumulates garbage as it's being used, so occasionally one needs to cleanup the store. For now there is a script for it: `cleanup-nix-store`.

TODO: In the future make it a background job.
