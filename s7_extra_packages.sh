#!/bin/sh
echo -e "\nInstalling Pip Dependencies"
pip install requests beautifulsoup4 lxml
fetched_version=$($HOME/.scripts/get-firefox-version)
echo -e "\nInstalling Firefox"
mkdir -p $HOME/Downloads/firefox_releases $HOME/Applications
download_firefox="wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/$fetched_version/linux-x86_64/en-US/firefox-$fetched_version.tar.bz2 -P $HOME/Downloads/firefox_releases/"
extract_firefox="tar -xvf $HOME/Downloads/firefox_releases/firefox-$fetched_version.tar.bz2 -C $HOME/Applications"
$download_firefox
$install_firefox
sudo ln -s /home/vivek/Applications/firefox/firefox /usr/bin/firefox
