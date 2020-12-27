echo "Rpi686 3.0 Debian Setup"
echo "Note: This may take a while, so get some popcorn."
echo "Copying Rpi686 to /usr/bin"
echo "Updating APT before starting"
sudo apt-get update
echo "Installing Qemu and Debootstrap"
sudo apt-get install qemu p7zip-full qemu-user-static binfmt-support debootstrap binutils
sudo debootstrap --foreign --arch amd64 stretch /home/pi/deb-rpi686 http://ftp.us.debian.org/debian
echo "Mounting"
sudo mount -t sysfs sys /home/pi/deb-rpi686/sys/
sudo mount -t proc proc /home/pi/deb-rpi686/proc/
sudo mount --bind /dev /home/pi/deb-rpi686/dev/
sudo mount --bind /dev/pts /home/pi/deb-rpi686/dev/pts/
sudo mount --bind /dev/shm /home/pi/deb-rpi686/dev/shm/
sudo cp /usr/bin/qemu-i386-static /home/pi/deb-rpi686/usr/bin/
echo "Half way there!"
sudo chroot /home/pi/deb-rpi686/ /debootstrap/debootstrap --second-stage
echo "Almost done! Just type in 'finish-it'.

