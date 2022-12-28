#!/usr/bin/env bash

# Install nativefier with npm
if [ -z "$(which nativefier)" ]; then
	echo "This application requires nativefier. Install it with:"

	if [ -z "$(which npm)" ]; then
		echo "sudo apt install nodejs"
	fi

	echo "npm install -g nativefier"
	exit
fi

# Install ImageMagick
if [ -z "$(which convert)" ]; then
	echo "This application requires ImageMagick. Install it with:"
	echo "sudo apt install imagemagick"
	exit
fi

if [ "$1" == "image" ]; then
	echo "Docker is no longer used for nativefier. You can skip this command and just run ./build.sh"
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
nativefier --name Loffice365 -p linux --internal-urls "(.*)" --browserwindow-options '{"webPreferences":{"nativeWindowOpen":true}}' https://www.office.com/ .
mv Loffice365-linux-x64 loffice-365
cp -a ../apps loffice-365/apps

tar cfz loffice-365.tgz loffice-365
mv loffice-365.tgz ../binaries
echo "
Built to binaries/loffice-365.tgz"

cd ..
rm -rf compile
chown $(id -u):$(id -g) binaries -R

