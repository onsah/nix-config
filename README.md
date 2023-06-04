# Nix Config
This repository contains Nix configuration for my devices.

## Prerequisites
* Nix Setup
* Home Manager Setup

## Usage

### Setting configuration for a user
For `$USER`:
```bash
home-manager switch -f ./users/$USER/home.nix 
```
