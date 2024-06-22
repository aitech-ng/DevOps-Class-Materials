# Install Azure cli on Linux, Windows or Mac

## azure cli on linux (CLI)

```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
sudo apt update
sudo apt install ca-certificates curl apt-transport-https lsb-release gnupg
sudo mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg
AZ_DIST=$(lsb_release -cs)
echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_DIST main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt update
sudo apt install azure-cli -y 
```
## azure cli on windows (GUI)

https://aka.ms/installazurecliwindowsx64

## azure cli on mac (CLI)

brew install
brew update && brew install azure-cli