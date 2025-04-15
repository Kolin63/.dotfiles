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
