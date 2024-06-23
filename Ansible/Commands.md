# Useful Ansible Commands

## Ad Hoc Commands

1. Ping all hosts in the inventory:

```bash
ansible all -m ping
```

2. Check disk space on all hosts:

```bash
ansible all -a "df -h"
```

3. Update all packages on Ubuntu servers:

```bash
ansible ubuntu -m apt -a "upgrade=yes update_cache=yes" --become
```

4. Restart a service on specific hosts:

```bash
ansible webservers -m service -a "name=nginx state=restarted" --become
```

5. Copy a file to multiple servers:

```bash
ansible all -m copy -a "src=/local/path/file.txt dest=/remote/path/file.txt"
```

## Playbook Commands

1. Run a playbook:

```bash
ansible-playbook playbook.yml
```

2. Run a playbook with a specific inventory file:

```bash
ansible-playbook -i inventory.ini playbook.yml
```

3. Run a playbook with extra variables:

```bash
ansible-playbook playbook.yml --extra-vars "variable1=value1 variable2=value2"
```

4. Run a playbook in check mode (dry run):

```bash
ansible-playbook playbook.yml --check
```

## Role Commands

1. Create a new Ansible role:

```bash
ansible-galaxy init myrole
```