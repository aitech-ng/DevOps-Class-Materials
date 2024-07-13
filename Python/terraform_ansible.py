import json
import subprocess

def get_terraform_output():
    result = subprocess.run(['terraform', 'output', '-json'], capture_output=True, text=True)
    return json.loads(result.stdout)

def create_ansible_hosts(ip_addresses):
    with open('ansible_hosts', 'w') as f:
        f.write("[terraform_vms]\n")
        for ip in ip_addresses:
            f.write(f"{ip}\n")

if __name__ == "__main__":
    tf_output = get_terraform_output()
    
    # Assuming your Terraform output has a key 'vm_public_ips' with a list of IP addresses
    ip_addresses = tf_output.get('vm_public_ips', {}).get('value', [])
    
    if ip_addresses:
        create_ansible_hosts(ip_addresses)
        print("Ansible hosts file created successfully.")
    else:
        print("No IP addresses found in Terraform output.")