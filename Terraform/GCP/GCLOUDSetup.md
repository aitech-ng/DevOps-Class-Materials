# Install Google Cloud CLI (gcloud) on Linux, Windows or Mac

## Linux (CLI)

```bash
# Add the Cloud SDK distribution URI as a package source
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Update and install the Cloud SDK
sudo apt update 
sudo apt install google-cloud-cli -y

```

## Windows (GUI)

Download and run the Google Cloud SDK installer:
https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe

## Mac (CLI)
Using Homebrew

```bash
brew install --cask google-cloud-sdk

# Download the Google Cloud SDK
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-438.0.0-darwin-x86_64.tar.gz

# Extract the archive
tar -xf google-cloud-cli-438.0.0-darwin-x86_64.tar.gz

# Run the install script
./google-cloud-sdk/install.sh

# Initialize gcloud
./google-cloud-sdk/bin/gcloud init
```