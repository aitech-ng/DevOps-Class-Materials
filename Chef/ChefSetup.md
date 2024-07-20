# Setting Up Chef Server and Client

This guide explains how to set up a Chef Server and Client configuration.

## Set Up Chef Server

1. Download and install Chef Server:

```bash
wget https://packages.chef.io/files/stable/chef-server/14.0.65/ubuntu/20.04/chef-server-core_14.0.65-1_amd64.deb
sudo dpkg -i chef-server-core_*.deb
```

2. Reconfigure and start Chef Server:

```bash
sudo chef-server-ctl reconfigure
```

3. Create admin user and organization:

```bash
sudo chef-server-ctl user-create admin Admin User admin@example.com 'password' --filename admin.pem
sudo chef-server-ctl org-create myorg 'My Organization' --association_user admin --filename myorg-validator.pem
```

4. Install Chef Manage (optional web UI):

```bash
sudo chef-server-ctl install chef-manage
sudo chef-server-ctl reconfigure
sudo chef-manage-ctl reconfigure
```

## Set Up Chef Workstation

5. Download and install Chef Workstation:

```bash
wget https://packages.chef.io/files/stable/chef-workstation/21.10.640/ubuntu/20.04/chef-workstation_21.10.640-1_amd64.deb
sudo dpkg -i chef-workstation_*.deb
```

6. Configure knife:

```bash
mkdir ~/.chef
cp admin.pem myorg-validator.pem ~/.chef/
knife configure
```

## Set Up Chef Client (on nodes to be managed):

7. Download and install Chef Client:

```bash
wget https://packages.chef.io/files/stable/chef/17.6.18/ubuntu/20.04/chef_17.6.18-1_amd64.deb
sudo dpkg -i chef_*.deb
```

8. Copy the validator secret key file to from the Chef server to the client node (you can use scp):

9. Move the key to the correct location. On the client node, move the validator key to the /etc/chef/ directory:

```bash
sudo mkdir -p /etc/chef
sudo mv myorg-validator.pem /etc/chef/
```

10. Set correct permissions. Ensure the key has the correct permissions:

```bash
sudo chown root:root /etc/chef/myorg-validator.pem
sudo chmod 600 /etc/chef/myorg-validator.pem
```

11. Update the client configuration. Create or edit the /etc/chef/client.rb file:

```bash
sudo nano /etc/chef/client.rb
```

Add or update these lines:

```ruby
chef_server_url 'https://your-chef-server-hostname-or-ip/organizations/myorg'
validation_client_name 'myorg-validator'
validation_key '/etc/chef/myorg-validator.pem'
ssl_verify_mode :verify_none
node_name  "Node1"
```

12. Run Chef client:

```bash
sudo chef-client
```

13. Configure git Identity:

```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

13. Create a cookbook:

```bash
mkdir -p /var/chef/cookbooks
cd /var/chef/cookbooks
chef generate cookbook maincookbook
cd maincookbook
```

14. Generate recipes for each component:

```bash
chef generate recipe docker
chef generate recipe postgres
chef generate recipe nginx
chef generate recipe remote_script
```

15. Edit the default recipe (recipes/default.rb) to include all other recipes:

```ruby
include_recipe 'maincookbook::docker'
include_recipe 'maincookbook::postgres'
include_recipe 'maincookbook::nginx'
include_recipe 'maincookbook::remote_script'
```

16. Create a `files/default` directory in your cookbook and copy the shell script to it:

```bash
mkdir -p /var/chef/cookbooks/maincookbook/files/default
cp script.sh cookbooks/maincookbook/files/default/script.sh
```

17. Upload the cookbook to the Chef Server:

```bash
echo "ssl_verify_mode :verify_none" >> ~/.chef/knife.rb
knife cookbook upload maincookbook
```

18. Add a recipe to a node's run list:

```bash
knife node run_list add Node1 'recipe[maincookbook::default]'
```

18. Run Chef client on the node:

```bash
sudo chef-client
```