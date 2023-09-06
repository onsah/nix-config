# Carbon M1 Mac
This user represents my Carbon M1 Mac work computer.

## Dependencies
* nix
* home-manager
* homebrew

## Homebrew Packages
I manage Homebrew packages via an [activation hook](https://rycee.gitlab.io/home-manager/options.html#opt-home.activation). 
This let's me maintain brew packages declaratively.
However, the `brew` itself is not managed via home manager, it needs to be installed separately.
I could use `nix-darwin` but I want to keep the setup simple.

## Sleepwatcher
I use sleepwatcher to disable bluetooth on sleep and reopen back on open.
