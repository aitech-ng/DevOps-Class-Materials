# Uninstall docker-compose (if installed)
sudo apt-get remove docker-compose -y

# Get latest binary version of docker-compose from github releases
curl -O -J -L https://github.com/docker/compose/releases/download/v2.11.2/docker-compose-linux-x86_64

# Make the binary executable.
chmod +x docker-compose-linux-x86_64

# Add this to binary look up location.
sudo cp ./docker-compose-linux-x86_64 /usr/bin/docker-compose

# check version
docker-compose version