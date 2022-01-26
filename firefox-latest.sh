echo 'Downloading Firefox package from Mozilla...'
wget -q -O firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
echo '✓'
echo ''

echo 'Unpacking and removing firefox.tar.bz2...'
tar xjf firefox.tar.bz2
sudo rm firefox.tar.bz2
echo '✓'
echo ''

echo 'Move firefox folder to /opt/...'
sudo mv firefox /opt/
echo '✓'
echo ''
echo 'Give firefox permission to update itself...'
sudo chmod 755 /opt/firefox
sudo chmod 755 /opt/firefox/firefox
echo '✓'
echo ''

echo 'Create desktop entry...'
echo '[Desktop Entry]
Name=Firefox
Comment=Web Browser
Exec=/opt/firefox/firefox %u
Terminal=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true' >firefox-stable.desktop

mkdir --parents .local/share/applications; mv firefox-stable.desktop .local/share/applications
echo '✓'
echo ''

echo 'Installing and removing Firefox ESR to install needed dependencies...'
sudo apt-get install firefox-esr
sudo apt remove firefox-esr
echo '✓'
echo ''
echo ''

echo 'All done! Firefox should now show up in your launcher. ✓'
sudo rm firefox-latest.sh