#!/usr/bin/env bash

# Install docker
if [ -z "$(which docker)" ]; then
	echo "This application requires docker. Install it with:

sudo apt install docker.io

You may need to add yourself to the docker group and reboot:

sudo groupadd docker
sudo usermod -aG docker \$USER"
	exit
fi

if [ "$1" == "image" ]; then
	cd /tmp
	git clone https://github.com/nativefier/nativefier.git
	cd nativefier
	docker build -t nativefier .
	exit
fi

rm -rf compile binaries
mkdir -p compile
mkdir -p binaries
cp apps/office/icon.png compile
chmod a+rw compile -R
chmod a+rw binaries -R
cd compile

# Linux
docker run -v "${PWD}":/target nativefier --name Loffice365 -p linux --internal-urls "(.*)" --browserwindow-options '{"webPreferences":{"nativeWindowOpen":true}}' https://www.office.com/ /target/
chown $(id -u):$(id -g) . -R
mv Loffice365-linux-x64 loffice-365
cp -a ../apps loffice-365/apps

tar cfz loffice-365.tgz loffice-365
mv loffice-365.tgz ../binaries
echo "
Built to binaries/loffice-365.tgz"

cd ..
rm -rf compile
chown $(id -u):$(id -g) binaries -R

