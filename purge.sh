mkdir -p setup
cd setup
for directory in ../services/*/ ; do
	../services/$directory/purge.sh
done
sudo DEBIAN_FRONTEND=noninteractive apt-get autoremove -y --force-yes
