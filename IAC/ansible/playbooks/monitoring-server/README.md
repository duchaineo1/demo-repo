# Monitoring server setup

Goal of this playbook is to setup a monitoring server/vm with alertmanager, prometheus, pushgateway and node_exporter.

## Usage

```bash
# example with Pass
pass show ansible/vault | ansible-playbook playbook.yml -i ../../inventories/inventory.ini --vault-pass=/bin/cat

# example without pass
ansible-playbook playbook ../../inventories/inventory.ini --ask-vault-pass
```

I prefer to use [pass](https://www.passwordstore.org) since I can store my secret encrypted and version controlled.
