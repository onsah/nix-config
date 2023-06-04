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
home-manager switch -f ./users/$USER/home.nix 
```
