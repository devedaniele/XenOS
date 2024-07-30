#!/usr/bin/bash
apt update && apt upgrade -y

apt install proot-distro -y
proot-distro install debian

apt install x11-repo -y
apt install termux-x11-nightly pulseaudio -y

echo -e "pulseaudio --start --exit-idle-time=-1\npacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" >> $PATH/audio
chmod +x $PATH/audio

cp xenos.bashrc.sh /data/data/com.termux/files/home/xenos.bashrc
cp .bashrc /data/data/com.termux/files/home/.bashrc
cp termux.bash_aliases.sh /data/data/com.termux/files/home/.bash_aliases
cp xenos.bash_aliases.sh /data/data/com.termux/files/home/xenos.bash_aliases

XENOS=$PREFIX/var/lib/proot-distro/installed-rootfs/debian/root

rm $XENOS/.bashrc 
cat > $XENOS/.bashrc  <<- EOF
#!/bin/bash
apt update && apt upgrade -y

apt install gnupg -y

rm -rf /etc/apt/sources.list
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list

curl -sSL https://archive.kali.org/archive-key.asc | apt-key add
mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d

apt-get update -y && apt-get dist-upgrade -y

apt install git gh sudo -y

rm .bashrc
mv /data/data/com.termux/files/home/xenos.bashrc /etc/bash.bashrc
cp /data/data/com.termux/files/home/.bashrc .bashrc
mv /data/data/com.termux/files/home/xenos.bash_aliases .bash_aliases

sleep 1
exit
EOF

pd login debian

cp termux.bashrc.sh $PREFIX/etc/bash.bashrc
exit