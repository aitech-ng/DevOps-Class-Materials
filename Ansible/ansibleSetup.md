# Setting Up Ansible Master-Slave Configuration

This guide explains how to set up an Ansible master-slave configuration using two virtual machines.

1. Create Virtual Machines

Create two virtual machines:
- `master-node`
- `slave-node`

2. Install Ansible on Master Node

For Ubuntu:

```bash
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible -y
```
For CentOS:

```bash
sudo yum update -y
sudo yum install ansible -y
```

3. Configure Inventory

Edit the Ansible inventory file:

```bash
sudo nano /etc/ansible/hosts
```

Add the following content (adjust IP addresses and key paths as needed):

```ini
[slave1]
<ip_address> ansible_ssh_user=ubuntu ansible_ssh_private_key_file=/home/ubuntu/key.pem
[slave2]
<ip_address> ansible_ssh_user=ubuntu ansible_ssh_private_key_file=/home/ubuntu/key.pem
```

4. Set Up SSH Key

Copy the slave node's private key from your local machine to the master node.
Create the key file on the master node:

``` bash
nano /home/ubuntu/key.pem
```

Paste the content of the slave's private key and save the file.

Set proper permissions for the key:

``` bash
chmod 400 /home/ubuntu/key.pem
```

5. Test Connection

Verify the connection to the slave nodes:

``` bash
ansible slaves -m ping
```

This command should return a success message if the connection is established correctly.

### Notes

- Ensure that the slave nodes have SSH access enabled and the necessary ports open.
- The ansible_ssh_user in the inventory should match the username on the slave nodes.
- Always keep your private keys secure and never share them publicly.

