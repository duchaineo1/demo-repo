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


Adjust your inventory as required, obv yours will be different than mine and for alertmanager you can use any receiver you like but I like discord since it's freeee I used (this doc)[https://promlabs.com/blog/2022/12/23/sending-prometheus-alerts-to-discord-with-alertmanager-v0-25-0/#:~:text=Set%20the%20alertmanager.yml%20config%20file%20to%3A]

My `alertmanager.yml` is encrypted since the webhook url is a secret :)
