echo "Rpi686 Setup"
echo "Note: This may take a while, so get some popcorn."
sudo cp Rpi686 /usr/bin
sudo apt-get install qemu qemu-user-static binfmt-support debootstrap binutils
sudo debootstrap --foreign --arch i386 stretch ./rpi686 http://ftp.us.debian.org/debian
sudo mount -t sysfs sys ./rpi686/sys/
sudo mount -t proc proc ./pi686/proc/
sudo mount --bind /dev ./pi686/dev/
sudo mount --bind /dev/pts /pi686/dev/pts/
sudo mount --bind /dev/shm ./pi686/dev/shm/
sudo cp /usr/bin/qemu-i386-static ./pi686/usr/bin/
echo "Half way there!"
sudo chroot ./pi686/ /debootstrap/debootstrap --second-stage
echo "Almost done! Just follow the rest of the instructions."
echo "Enter 'adduser -uid 1000 pi' in the terminal, enter your name, etc. After that, type logout, and type in Rpi686"

