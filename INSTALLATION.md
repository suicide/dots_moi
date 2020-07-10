## Installation instruction

### pacman / yay

use package list in `~/.config/yay-package.list` as example. This probaly need
some cleanup.

### LightDM

use `~/.config/_lightdm/lightdm.conf` as example for
`/etc/lightdm/lightdm.conf`. Basically only set the greeter and the setup
script to run xrandr.

### Autofs

move config from `~/.config/_autofs` to `/etc/autofs`.

This is needed to access the filedump via ssh and the backup via smb.

### Borg

Use `anacron` for daily backups. move `~/.config/_cron/daily/borg-backup` to
`/etc/cron.daily/borg-backup`.

The config in `~/.config/borg` should be fine otherwise. watch out for paths
