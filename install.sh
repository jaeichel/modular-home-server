# Prereqs
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y curl git vim
mkdir -p setup

sudo apt-get update -y
cd setup
for directory in ../services/*/ ; do
	../services/$directory/install.sh
done
sudo DEBIAN_FRONTEND=noninteractive apt-get autoremove -y --force-yes
