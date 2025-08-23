# Reminders
For obscure Linux things that I will forget.

## Audio
Make sure pulseaudio and pavucontrol are installed. In pavucontrol, unmute the 
output device. See [this StackOverflow 
answer](https://askubuntu.com/questions/14077/) for more information.

## Mounting Drives
To find the name of the drive, use `lsblk`. The name will be something like sdb 
or sdb1 or sdc. Run `sudo mount /dev/sdb /mnt/directory -m` to mount it to a 
directory. The -m means make a new directory if it doesn't already exist.

To unmount, use `sudo umount /mnt/directory`

## Wifi or Ethernet
Use `nmtui`

## View Disk Usage
Use `df -h`
