# XFCE Display Resolution Switcher

Simple bash scripts to switch between 4K (HiDPI) and 1080p display settings in XFCE desktop environment on a VM.

## Scripts

- **`switch-to-4k.sh`** - Enables HiDPI scaling for 4K displays (2x scaling)
- **`switch-to-1080p.sh`** - Reverts to standard 1080p display settings (1x scaling)

## What They Do

These scripts configure:
- GTK/GDK scaling factors
- Qt application scaling
- Cursor size
- XFCE theme (Kali-Dark vs Kali-Dark-xHiDPI)
- Terminal font sizes
- Window manager settings
- Root user environment

## Installation

1. Make the scripts executable:
```bash
chmod +x switch-to-4k.sh switch-to-1080p.sh
```

2. Optionally, move them to your PATH:
```bash
sudo mv switch-to-*.sh /usr/local/bin/
```

## Usage

To switch to 4K/HiDPI mode:
```bash
./switch-to-4k.sh
```

To switch back to 1080p:
```bash
./switch-to-1080p.sh
```

**Note:** Already running applications will need to be restarted to pick up the new scaling settings.

## Requirements

- XFCE desktop environment
- Kali Linux (or Kali-Dark themes installed)
- sudo privileges

## Credits

Created by [Kyser Clark](https://KyserClark.com)  
Modified by Albert LaScola
