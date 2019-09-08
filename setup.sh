echo "Rpi686 2.0 Setup"
echo "Note: This may take a while, so get some popcorn."
echo "Copying Rpi686 to /usr/bin"
sudo cp Rpi686-root /usr/bin
sudo cp finish-it /home/pi/pi686/usr/bin/
sudo cp Rpi686 /usr/bin
echo "Installing Qemu and Debootstrap"
sudo apt-get install qemu qemu-user-static binfmt-support debootstrap binutils
sudo debootstrap --foreign --arch i386 stretch ./rpi686 http://ftp.us.debian.org/debian
echo "Mounting"
sudo mount -t sysfs sys ./rpi686/sys/
sudo mount -t proc proc ./rpi686/proc/
sudo mount --bind /dev ./rpi686/dev/
sudo mount --bind /dev/pts /rpi686/dev/pts/
sudo mount --bind /dev/shm ./rpi686/dev/shm/
sudo cp /usr/bin/qemu-i386-static ./rpi686/usr/bin/
echo "Half way there!"
sudo chroot ./rpi686/ /debootstrap/debootstrap --second-stage
echo "Almost done! Just type in 'finish-it'.

