# Kolin63's Dotfiles

## Symlink

### Linux
Run symlink.sh to make symlinks
chmod 755 it to make it executable

### Windows
Windows doesn't have a good symlink command,
so you have to make a `.vimrc` in the default
directory and add `so <directory to this vimrc>`

## Rebind
Rebind Caps to Escape

### Linux
Edit `/etc/default/keyboard` and add the line
`XKBOPTIONS="caps:escape"` then reboot to take effect

### Windows
Rebind.ahk is an autohotkey script for Windows 
that binds Caps to Escape

Press Win+R and go to shell:startup, then copy 
the script into that directory

To make windows alias, put the following in $profile
`Set-Alias -Name vim -Value nvim`

## Kinesis Advantage 2

Enter Power User Mode with Program+Shift+Escape. Mount the device with
Program+F1.

### Linux
Use `lsblk` to find the name of the new 4 Megabyte Drive. It will be sdb or
something. Run `sudo mount /dev/sdb /mnt/ADVANTAGE2 -m`. The `-m` is to make a
new directory if it doesn't exist, so you only need it if you haven't already
made the directory. Then run ./update-advantage.sh in this .dotfiles folder.
Then run `sudo umount /mnt/ADVANTAGE2` and then press Program+F1.
