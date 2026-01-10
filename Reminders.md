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
Use `df -h` for total disk usage. Use `du -sh <dir>` for directory size.

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

## Reverse Scroll
Find the id of your mouse or trackpad with `xinput list`. Next, run `xinput
list-props <id>` and look for something like Reverse Scroll or Natural Scroll,
and note the number next to it (something like 308). Finally, run `xinput
set-prop <mouse id> <reverse scroll id> <value>`. Value will probably be 1.

## Flashing an ISO
Plug in the drive, then run `lsblk` to find the name. It will be something like
`/dev/sdb`. Download the iso file. Then, run
```bash
sudo dd bs=4M if=/path/to/file.iso of=/dev/sdX status=progress oflag=sync
```

## Wake on LAN
```bash
nmcli connection show # find the connection name for ethernet
sudo nmcli connection modify "<CONNECTION_NAME>" 802-3-ethernet.wake-on-lan magic
sudo nmcli connection up "<CONNECTION_NAME>" # re-apply connection
```

## Compiling a C++ Project to a Library
I had to do this with the Extism CPP SDK because they only had CMake
instructions but I HATE CMake (not that much but I don't love it).
```bash
g++ -std=c++23 -Iinclude -c src/*.cpp
#                        ^^
#                this does the magic

# then a bunch of .o object files will be made
# so we use the ar command to make it to .a
ar rcs libextismcpp.a *.o
#      ^^^^^^^^^^^^
#      what you want to call it
```

## Format a drive
```bash
sudo mkfs -t ext4 /dev/xyz
```
