# Carbon M1 Mac
This user represents my Carbon M1 Mac work computer.

## Dependencies
* All the dependencies in the top level [README](../../README.md#prerequisites)
* [homebrew](https://brew.sh/)

## Homebrew Packages (brewBundleHook)
I manage `homebrew` packages via an [activation hook](https://rycee.gitlab.io/home-manager/options.html#opt-home.activation). 
This let's me maintain brew packages declaratively.
However, the `brew` itself is not managed via home manager, it needs to be installed separately.
I could use `nix-darwin` but I want to keep the setup simple.

## Sleepwatcher
I use [sleepwatcher](https://github.com/perbu/sleepwatcher) to disable bluetooth on sleep and reopen back on open.

## Fonts (fontsHook)
TODO

## RTX
[rtx](https://github.com/jdx/rtx) is an alternative to [asdf](https://github.com/asdf-vm/asdf). It's generally faster and more reliable in my experience.

## Starship
[starship](https://github.com/starship/starship) is a shell prompt. I like that it shows current path, git status etc. 
