# Kolin63's Dotfiles

## Symlink
Run symlink.sh to make symlinks
chmod 755 it to make it executable

## Rebind
Rebind Caps to Escape

### Windows
Rebind.ahk is an autohotkey script for Windows 
that binds Caps to Escape

Press Win+R and go to shell:startup, then copy 
the script into that directory

### Linux
Edit `/etc/default/keyboard` and add the line
`XKBOPTIONS="caps:escape"` then reboot to take effect
