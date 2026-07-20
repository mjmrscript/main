# Ubuntu Toolkit Scripts

A collection of Bash scripts for Ubuntu system info, mirror management, and Bash setup.

## Scripts

### `information_PC_ubuntu.sh`
Interactive menu to show kernel version, Ubuntu version, IP address, disk/RAM/CPU info, and virtualization status.

```bash
chmod +x information_PC_ubuntu.sh
./information_PC_ubuntu.sh
```

### `mirror-changer.sh`
Switches Ubuntu APT mirrors (Iranian mirrors or official default) using the `.sources` format.

```bash
chmod +x mirror-changer.sh
sudo ./mirror-changer.sh
```

Requires root and `lsb-release`. After selecting a mirror, run `sudo apt update`.

### `ble_full_setup.sh`
Installs and configures [ble.sh](https://github.com/akinomyoga/ble.sh) with a custom `.blerc` (syntax highlighting, autocomplete).

```bash
chmod +x ble_full_setup.sh
./ble_full_setup.sh
source ~/.bashrc
```

## Requirements

- Ubuntu / Debian-based system
- `sudo` access (for `mirror-changer.sh`)
- Internet connection
