# Loffice 365

An electron wrapped Office 365 application integrated into your file manager as if it was a native application.

<img src="screenshots/loffice-365.gif">

## Supported applications

<table cellpadding="10" cellspacing="0" border="0">
  <tr>
    <td><img src="apps/excel/icon.svg" width="100"></td><td>Microsoft Excel 365</td>
    <td><img src="apps/onenote/icon.svg" width="100"></td><td>Microsoft OneNote 365</td>
  </tr>
  <tr>
    <td><img src="apps/outlook/icon.svg" width="100"></td><td>Microsoft Outlook 365</td>
    <td><img src="apps/powerpoint/icon.svg" width="100"></td><td>Microsoft PowerPoint 365</td>
  </tr>
  <tr>
    <td><img src="apps/project/icon.svg" width="100"></td><td>Microsoft Project 365</td>
    <td><img src="apps/word/icon.svg" width="100"></td><td>Microsoft Word 365</td>
  </tr>
</table>

## How it works
- When opening a file on your local system, it is symlinked to a temporary OneDrive folder
- The [onedrive](https://github.com/abraunegg/onedrive) application is then used to synchronize that folder to OneDrive
- The file is then opened in a [nativefied](https://github.com/nativefier/nativefier) version of Office 365
- Once the application is closed, [onedrive](https://github.com/abraunegg/onedrive) syncs the file back locally, and the file in OneDrive is removed

## Installation
First, you will need the linux OneDrive CLI client, zenity, and ImageMagick if it is not already installed. In Ubuntu, this can be installed with:
``` bash
sudo add-apt-repository ppa:yann1ck/onedrive  # not needed on Pop!_OS
sudo apt-get update
sudo apt install onedrive zenity imagemagick
```
Next, login to your OneDrive personal or business account:
``` bash
onedrive
```
After visiting the URL that is provided, your browser will end on a blank page. Copy the URL from the location bar, and paste it at the prompt to complete the login.

After that, run the installer for Loffice 365:
``` bash
# Option 1: Download and run the installer only
curl -s https://raw.githubusercontent.com/adil192/loffice-365/main/installer.sh | bash -s

# Option 2: Clone the repo and run the installer
git clone https://github.com/adil192/loffice-365.git
cd loffice-365
./installer.sh
```

## Usage
Simply run one of the available commands, start from a shortcut, or double click/right click and open a file.
- `excel`
- `office`
- `onenote`
- `outlook`
- `powerpoint`
- `project`
- `word`

## Compiling yourself
[Nativefier](https://github.com/nativefier/nativefier/) is required to build images. You can install it by cloning this repo and running `npm install`.
Alternatively, you can install it manually with `npm install -g nativefier`, or see other options in [Nativefier's Installation instructions](https://github.com/nativefier/nativefier/#installation).

Run the build:
``` bash
./build.sh
```

After that, setup onedrive then run the installer for loffice-365:
``` bash
# Run this if you haven't logged in to onedrive yet
onedrive

# Run the installer
# It will automatically detect the archive you just built.
./installer.sh
```

## Icon licenses
- Fluent UI React - Icons under [MIT License](https://github.com/Fmstrat/fluent-ui-react/blob/master/LICENSE.md)
- Fluent UI - Icons under [MIT License](https://github.com/Fmstrat/fluentui/blob/master/LICENSE) with [restricted use](https://static2.sharepointonline.com/files/fabric/assets/microsoft_fabric_assets_license_agreement_nov_2019.pdf)
- New app icons made by [Pixel perfect](https://www.flaticon.com/authors/pixel-perfect) from [www.flaticon.com](https://www.flaticon.com/), exceptions
  - the Outlook icon was modified to have a white background
  - the OneNote and Project icons which were made by adil192 based on the other Pixel perfect icons.
