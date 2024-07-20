# Useful Ansible-Galaxy Commands

1. Create a new Ansible role:

```bash
ansible-galaxy init myrole
```

2. List installed roles:

```bash
ansible-galaxy list
```

3. Install role from Ansible Galaxy:

```bash
ansible-galaxy role install axemann.docker_compose_generator
```

4. Create a requirements.yml file for role dependencies:

```yaml                                                              
- src: aurxl.nginx_ws
  version: v1.0.7
```

5. Install roles from a requirements.yml file:

```bash
ansible-galaxy install -r requirements.yml
```

6. Remove an installed role:

```bash
ansible-galaxy remove aurxl.nginx_ws
```

7. Search for roles on Ansible Galaxy:

```bash
ansible-galaxy search docker
```

8. Info about a specific role:

```bash
ansible-galaxy info aurxl.nginx_ws
```

## Linting and testing

9. Install Python Virtual Environment Tools, Pip and Ansible-Lint:

```bash
sudo apt install ansible-lint python3-pip python3-virtualenv -y
```

10. Create and Activate Virtual Environment:

```bash
python3 -m virtualenv venv
source venv/bin/activate
```

11. Lint a role to ensure it follows best practices:

```bash
ansible-lint .ansible/role/myrole
```

12. Create and Activate Virtual Environment for Molecule:

```bash
python3 -m virtualenv molecule-env
source molecule-env/bin/activate
```

13. Get the latest version of Molecule and the Docker driver installed:

```bash
pip install --upgrade molecule molecule-docker
```

14. Edit the 'molecule/default/molecule.yml' file:

```yaml
---
dependency:
  name: galaxy
driver:
  name: docker
platforms:
  - name: instance
    image: docker.io/pycontribs/ubuntu:latest
    pre_build_image: true
provisioner:
  name: ansible
verifier:
  name: ansible
```

15. Initialize a new scenario:

```bash
molecule init scenario my_scenario_name
```

16. Run Molecule commands:

```bash
molecule create
molecule converge
molecule verify
molecule test
```
