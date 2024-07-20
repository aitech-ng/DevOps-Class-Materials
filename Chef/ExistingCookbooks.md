# Working with Existing Cookbooks and Test Kitchen

## Using Existing Cookbooks

1. Search for cookbooks:

```bash
knife supermarket search docker
```

2. Download a cookbook:

```bash
knife supermarket download ama-docker-compose
```

3. Extract the tarball using the tar command:

```bash
tar -xzvf ama-docker-compose-0.1.2.tar.gz
```
This command does the following:

-x: Extract files from an archive
-z: Filter the archive through gzip
-v: Verbosely list files processed
-f: Use archive file

4. Move or copy this directory to your Chef cookbooks directory:

```bash
mv ama-docker-compose-0.1.2 /var/chef/cookbooks
```

## Alternatively 

3. Install a cookbook (downloads and adds to your cookbooks directory):

```bash
knife supermarket install docker-nginx
```

4. Upload a cookbook to your Chef server:

```bash
knife cookbook upload ama-docker-compose
```

## Working with Test Kitchen:

5. Ensure Test Kitchen is installed:

```bash
chef gem install kitchen-docker
```

6. Initialize Test Kitchen in your cookbook:

```bash
kitchen init
```

Configuration
7. Edit .kitchen.yml:

```yaml
---
driver:
  name: docker

provisioner:
  name: chef_zero

platforms:
  - name: ubuntu-20.04

suites:
  - name: default
    run_list:
      - recipe[maincookbook::default]
    attributes:
```

8. Move the cookbook to a folder named 'cookbooks' in the same directory as the kitchen.yml file:

```bash
mkdir cookbooks
cp -r /var/chef/cookbooks/maincookbook cookbooks/maincookbook
```

9. Install docker:

```bash
sudo apt install docker.io -y && sudo chmod 667 /var/run/docker.sock
```

## Basic Commands

- List all test instances:

```bash
kitchen list
```

- Create a test instance:

```bash
kitchen create
```

- Converge (run Chef) on a test instance:

```bash
kitchen converge
```

- Run tests on a test instance:

```bash
kitchen verify
```

- Destroy a test instance:

```bash
kitchen destroy
```

- Run full test cycle (create, converge, verify, destroy):

```bash
kitchen test
```

## Find community cookbooks here: https://supermarket.chef.io/