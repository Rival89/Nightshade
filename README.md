# Nightshade

Nightshade is a modular penetration testing framework written in Bash. It aims to provide a simple menu-driven interface for launching common offensive security tools and automation scripts on Kali Linux systems.

## Features

- Modular architecture with separate scripts for each stage of an engagement
- Logging of tool output to the `nightshade/logs` directory
- Temporary workspace creation in `nightshade/temp`
- Easy to extend with additional modules or custom scripts

## Usage

Run the main script as root:

```bash
sudo ./nightshade/nightshade.sh
```

Select a module from the menu and follow the prompts. Output from commands is stored in the logs directory for later review.

## Modules

- **Reconnaissance** – basic `nmap` scans and OS detection
- **Pre-Operation** – update system packages and create workspace directories
- **Attack** – launch brute force attacks with `hydra`
- **Exploitation** – search exploit-db or open `msfconsole`
- **Post-Exploitation** – gather system information
- **Evasion** – clear command history

Feel free to customize or add new modules under `nightshade/modules`.
