# Jenkins Configuration Guide

This guide provides instructions for configuring Jenkins after installation, setting up projects, and configuring a slave agent.

## Initial Jenkins Configuration

- Open `http://your_server_ip:8080` in a web browser.

- Retrieve the initial admin password:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

- Enter the password in the Jenkins web interface.

- Install suggested plugins or select specific plugins to install.

- Create the first admin user when prompted.

## Install Additional Plugins

- Go to Manage Jenkins -> Plugins -> Available plugins
- Search for and install plugins specific to your tasks

## Create Access Token for GitHub/GitLab

- For GitHub: Account settings -> Developer settings -> Personal access tokens
- For GitLab: User settings -> Access Tokens

## Set Up Project Pipeline

### Single Branch Pipeline

- Dashboard -> New Item -> Pipeline
- Configure source (Git/GitHub/GitLab)
- Set up credentials:
    - For GitHub:
        - Pipeline -> Pipeline script from SCM -> Git
        - Paste repo URL
        - Credentials: Username (GitHub username) and Password (Access Token)

    - For GitLab:
        - Manage Jenkins -> System -> GitLab -> Add Access Token as secret text
        - Test connection
        - In project configuration, select GitLab connection and set up build triggers
        - Generate secret token for the webhook

### Multi-Branch Pipeline

- Dashboard -> New Item -> Multibranch Pipeline
- Configure source (Git/GitHub/GitLab)
- Set up credentials:
    - For GitHub: Username (GitHub username) and Password (Access Token)
    - For GitLab: Username (GitLab username) and Password (Access Token)

## Set Up Webhook
- For GitHub:
    - Repository settings -> Webhooks -> Add webhook
    - Payload URL: http://your_jenkins_url:8080/github-webhook/


- For GitLab (Pipeline project):
    - Settings -> Webhooks
        - URL: http://your_jenkins_url:8080/project/JobName
        - Secret Token: Use token generated in Jenkins


- For GitLab (Multibranch Pipeline project):
    - Settings -> Integrations -> Jenkins
        - Jenkins server URL: http://your_jenkins_url:8080
        - Project name: Jenkins job name
        - Username and Password: Jenkins credentials



## Additional Configuration (Optional)
### Set up Jenkins user and install dependencies:

```bash
# Set password for Jenkins user
sudo passwd jenkins

# Add Jenkins user to sudo group
sudo usermod -aG sudo jenkins

# Switch to Jenkins user
sudo su jenkins

# Install Git and Docker
sudo apt install git docker.io -y

# Generate SSH key
ssh-keygen

# Display public key (add this to GitHub/GitLab SSH settings)
cat ~/.ssh/id_rsa.pub
```

## Configure Jenkins Slave Agent
### To set up a Jenkins slave agent on another VM:

- Create a new virtual machine
- Install dependencies on the slave VM:

```bash
sudo apt update
sudo apt install openjdk-17-jdk -y
sudo adduser jenkins
sudo usermod -aG sudo jenkins
sudo mkdir -p /home/jenkins
sudo chown -R jenkins:jenkins /home/jenkins
sudo chmod 755 /home/jenkins
```

- Set up agent node in Jenkins:
    - Manage Jenkins -> Nodes -> New Node
    - Select "Permanent Agent"
    - Launch method: "Launch agents via SSH"
    - Add credentials (username and private key)
    - Set root directory to /home/jenkins


