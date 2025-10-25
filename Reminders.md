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
Use `nmtui`. One problem I had was when I setup Wifi using the Ubuntu
installation tool, and then Network Manager wouldn't discover any Wifi
networks. What you have to do is edit `/etc/netplan/someyamlfile` and add the
renderer line:
```yaml
network:
  version: 2
  renderer: NetworkManager
  ...
```
then `sudo netplan generate` and `sudo netplan apply` then `sudo systemctl
restart NetworkManager`.

## Slow Boot Times
If it's from the network manager, do this:
```bash
sudo systemctl disable --now systemd-networkd-wait-online.service
sudo systemctl mask systemd-networkd-wait-online.service
sudo systemctl disable --now systemd-networkd.service systemd-networkd.socket
sudo netplan generate
sudo netplan apply
```
Then reboot.

## View Disk Usage
Use `df -h`

## Enable GPU Acceleration
[here](https://www.tech2geek.net/how-to-enable-gpu-acceleration-on-linux-nvidia-
amd-support/), or just do this
```bash
# sudo apt install nvidia-driver-550 # for nvidia
# sudo apt install amdgpu # for amd
sudo apt install vainfo vdpauinfo
glxinfo | grep render
# should see OpenGL renderer string: NVIDIA GeForce...
```

## Emojis
```bash
sudo apt install fonts-noto-color-emoji
```
and restart the program.
