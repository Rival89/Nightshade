# Nightshade

Nightshade is an interactive red team operations framework written in Bash.
It uses [gum](https://github.com/charmbracelet/gum) to provide a polished
command line user interface. The framework is modular and each major
capability is implemented in a separate script within `nightshade/modules`.

## Features

- Pre-Op tools such as MAC address changes and IP display
- Reconnaissance helpers using `whois` and `nmap`
- Placeholder modules for attack, evasion, exploitation and post-exploitation

## Usage

Run the main launcher:

```bash
./nightshade/nightshade.sh
```

Nightshade will check for required dependencies on first run and attempt to
install `gum` if it is missing.
