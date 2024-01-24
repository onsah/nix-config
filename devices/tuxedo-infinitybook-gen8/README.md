# Tuxedo Infinity Book 16 README

Layout
```
.
└── tuxedo-control/
```

## Tuxedo Control
Controls the hardware such as fans, and keyboard. 

I use https://github.com/AaronErhardt/tuxedo-rs. It profiles command line program `tailor` for switching between the profiles.

### Profiles
Such settings are defined by profiles, and changes are achieved by [switching between them](#switching-between-profiles).

#### Switching between profiles
```
tailor profile list
tailor profile set $PROFILE
```

#### Profile Structure

Profiles exit under `/etc/tailord/profiles/` and has the following structure:
```json
{
  "fans": [
    "default"
  ],
  "leds": [],
  "performance_profile": null
}
```
* `fans`: Points to the file for the fan settings. These files are under `/etc/tailord/fan/` Example fan setting file:
```json
[
  {
    "temp": 25,
    "fan": 0
  },
  {
    "temp": 30,
    "fan": 10
  },
  {
    "temp": 40,
    "fan": 22
  }
]
```
Each option sets the fan speed for the respective temperature.

#### Managing profiles
Available profiles are managed via nix. It's in `./tuxedo-control/default.nix`.

