# Download
DOWNLOAD_PLEX=$(curl -o plexmediaserver.deb -z plexmediaserver.deb https://downloads.plex.tv/plex-media-server/0.9.12.7.1356-7f37aa9/plexmediaserver_0.9.12.7.1356-7f37aa9_amd64.deb -s --location --write-out %{http_code})

if [[ "$DOWNLOAD_PLEX" == "200" ]]; then
	sudo dpkg -i plexmediaserver.deb
fi

