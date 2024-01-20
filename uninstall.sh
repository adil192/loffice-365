#!/usr/bin/env bash

set -e

source loffice-365.bashrc

echo -e "\n\n0/4. Uninstalling Loffice365..."

echo -e "\n\n1/4. Removing files from bin..."
for APP in $(find ./apps/* -type d); do
    APP_NAME=$(basename "${APP}")
    echo "Removing ~/.local/bin/${APP_NAME}"
    rm -f "~/.local/bin/${APP_NAME}"
done

echo -e "\n\n2/4. Removing binaries..."
echo "Removing ~/.local/share/loffice-365/"
rm -rf ~/.local/share/loffice-365/

echo -e "\n\n3/4. Removing desktop entries..."
echo -n "Removing "
echo ~/.local/share/applications/loffice-365-*.desktop
rm -f ~/.local/share/applications/loffice-365-*.desktop

echo -e "\n\n4/4. Removing onedrive sync folder..."
echo "Removing ~/OneDrive/Loffice365/"
rm -rf ~/OneDrive/Loffice365/

echo -e "\n\nDone!"
echo "You can also uninstall the onedrive CLI if you want. Run:"
echo "    rm -vrf ~/.config/onedrive/"
echo "    sudo apt purge onedrive"
echo "    sudo rm -vf /etc/systemd/user/default.target.wants/onedrive.service /usr/lib/systemd/user/onedrive.service"
echo "    sudo add-apt-repository --remove ppa:yann1ck/onedrive"
echo "    sudo rm -vf /etc/apt/sources.list.d/onedrive.list"
