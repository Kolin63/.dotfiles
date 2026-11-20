#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <device path>"
  exit 1
fi

if [[ ! -e "$1" ]]; then
  echo "Device $1 does not exist. Is it in the /dev directory?"
  exit 1
fi

if [[ ! -d "/dev/DO_NOT_TOUCH" ]]; then
  sudo mkdir "/dev/DO_NOT_TOUCH"
fi

sudo mv "$1" "/dev/DO_NOT_TOUCH"

# [forum](https://superuser.com/questions/278396/systemd-does-not-run-etc-rc-local).
#
# Arch might not have included the service unit file necessary to run rc.local.
#
# Just create a file `/etc/systemd/system/rc-local.service` with the following
# contents (copied verbatim from my Fedora systemd system):
#
# ```
# #  This file is part of systemd.
# #
# #  systemd is free software; you can redistribute it and/or modify it
# #  under the terms of the GNU General Public License as published by
# #  the Free Software Foundation; either version 2 of the License, or
# #  (at your option) any later version.
#
# [Unit] Description=/etc/rc.local Compatibility ConditionPathExists=/etc/rc.local
#
# [Service] Type=forking ExecStart=/etc/rc.local start TimeoutSec=0
# StandardOutput=tty RemainAfterExit=yes SysVStartPriority=99
# ```
#
# Then, just run `systemctl enable rc-local.service` as root to enable it. You can
# also test it/run it now by running `systemctl start rc-local.service`.

# sample /etc/rc.local:
# #!/usr/sbin/env bash
#
# bash /home/colin/.dotfiles/scripts/protectdrive.sh "/dev/sda"
# bash /home/colin/.dotfiles/scripts/protectdrive.sh "/dev/sda1"
# bash /home/colin/.dotfiles/scripts/protectdrive.sh "/dev/sda2"
#
# bash /home/colin/.dotfiles/scripts/protectdrive.sh "/dev/nvme0n1"
# bash /home/colin/.dotfiles/scripts/protectdrive.sh "/dev/nvme0n1p1"
# bash /home/colin/.dotfiles/scripts/protectdrive.sh "/dev/nvme0n1p2"
# bash /home/colin/.dotfiles/scripts/protectdrive.sh "/dev/nvme0n1p3"
# bash /home/colin/.dotfiles/scripts/protectdrive.sh "/dev/nvme0n1p4"
# bash /home/colin/.dotfiles/scripts/protectdrive.sh "/dev/nvme0n1p5"
# bash /home/colin/.dotfiles/scripts/protectdrive.sh "/dev/nvme0n1p6"
