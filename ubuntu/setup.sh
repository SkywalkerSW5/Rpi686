echo "Rpi686 3.0 Ubuntu Setup"
echo "Note: This may take a while, so get some popcorn."
echo "Copying Rpi686 to /usr/bin"
echo "Installing Qemu and Debootstrap"
sudo apt-get install qemu p7zip-full qemu-user-static binfmt-support debootstrap
sudo debootstrap --foreign --arch amd64 bionic /home/pi/ubuntu-rpi686 http://us.archive.ubuntu.com/ubuntu/
echo "Mounting"
sudo mount -t sysfs sys /home/pi/ubuntu-rpi686/sys/
sudo mount -t proc proc /home/pi/ubuntu-rpi686/proc/
sudo mount --bind /dev /home/pi/ubuntu-rpi686/dev/
sudo mount --bind /dev/pts /home/pi/ubuntu-rpi686/dev/pts/
sudo mount --bind /dev/shm /home/pi/ubuntu-rpi686/dev/shm/
sudo cp /usr/bin/qemu-i386-static /home/pi/ubuntu-rpi686/usr/bin/
echo "Half way there!"
sudo chroot /home/pi/ubuntu-rpi686/ /debootstrap/debootstrap --second-stage
echo "Almost done! Just type in 'finish-it'.

