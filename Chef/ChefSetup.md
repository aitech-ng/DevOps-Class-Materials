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

8. Configure the client:

```bash
sudo chef-client -S https://chef-server.example.com/organizations/myorg -K /path/to/myorg-validator.pem
```

9. Create a cookbook:

```bash
chef generate cookbook mycookbook
```

10. Upload the cookbook to the Chef Server:

```bash
chef generate cookbook mycookbook
```

11. Add a recipe to a node's run list:

```bash
knife node run_list add NODE_NAME 'recipe[mycookbook::default]'
```

12. Run Chef Client on the node:

```bash
sudo chef-client
```