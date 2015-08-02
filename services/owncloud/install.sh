# Setup Keys
DOWNLOAD_OWNCLOUD_KEY=$(curl -z owncloud-release.key -o owncloud-release.key http://download.opensuse.org/repositories/isv:ownCloud:community/xUbuntu_14.04/Release.key -s --location --write-out %{http_code})
if [[ "$DOWNLOAD_OWNCLOUD_KEY" == "200" ]]; then
	sudo apt-key add - < owncloud-release.key
	sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/community/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/owncloud.list"
	sudo apt-get update -y
fi

# Install
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes \
	owncloud mariadb-server

# Configure
SQL_DATABASE_PWD=""
mysql --user="root" --password="$SQL_DATABASE_PWD" --execute="CREATE DATABASE owncloud; GRANT ALL ON owncloud.* to 'owncloud'@'localhost' IDENTIFIED BY '$SQL_DATABASE_PWD';"
