# Setting Up Puppet Master and Agent

This guide explains how to set up a Puppet Master and Agent configuration.

## Set Up Puppet Master

1. Install Puppet Server:

```bash
wget https://apt.puppetlabs.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb
sudo apt update
sudo apt install puppetserver
```

2. Configure Puppet Server:

Edit /etc/puppetlabs/puppet/puppet.conf:

```ini
[master]
dns_alt_names = puppet,puppet.example.com

[main]
certname = puppet.example.com
```

3. Start Puppet Server:

```bash
sudo systemctl start puppetserver
sudo systemctl enable puppetserver
```

## Set Up Puppet Agent

4. Install Puppet Agent:

```bash
wget https://apt.puppetlabs.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb
sudo apt update
sudo apt install puppet-agent
```

5. Configure Puppet Agent:

Edit /etc/puppetlabs/puppet/puppet.conf:

```ini
[main]
certname = agent.example.com
server = puppet.example.com
```

6. Start Puppet Agent:

```bash
sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
```

7. Certificate Signing, On the Puppet Agent, generate a certificate request:

```bash
sudo /opt/puppetlabs/bin/puppet ssl bootstrap
```

8. On the Puppet Master, list and sign the certificate:

```bash
sudo /opt/puppetlabs/bin/puppetserver ca list
sudo /opt/puppetlabs/bin/puppetserver ca sign --certname agent.example.com
```

9. Basic Usage, Create a manifest on the Puppet Master:

```bash
sudo nano /etc/puppetlabs/code/environments/production/manifests/site.pp
```

Add content:

```puppet
node 'agent.example.com' {
  file { '/tmp/hello.txt':
    ensure  => present,
    content => "Hello, Puppet!\n",
  }
}
```

10. Run Puppet on the agent:

```bash
sudo /opt/puppetlabs/bin/puppet agent --test
```