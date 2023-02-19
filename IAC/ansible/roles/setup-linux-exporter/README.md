Role Name
=========

This role is used to setup node_exporter on a linux server.


Role Variables
--------------

See `defaults/main.yml` to modify the version to download (or override the variable via your playbook)

Example Playbook
----------------

```YAML
---
- hosts: all
  become: true
  become_user: root
  roles:
    - setup-prometheus
    - setup-alert-manager
```

