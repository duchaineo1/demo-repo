daily-setup
=========

Default configuration of my daily desktop.

Role Variables
--------------

```yaml
username: "olivier"
target_gui_enabled: true # If set to true enables install for: vscode
packages: # List of packages you want install by default
  - git
  - curl
  - vim 
  - ansible 
  - zsh
  - wget
  - bat
network: # See netplan template in vars/template
  STATIC: true # Set network config as static
  TARGET_IP_ADDRESS: "x.x.x.x/24" # Desired IP adress with network mask
  DNS_SERVER: "x.x.x.x" 
  DEFAULT_GATEWAY: "x.x.x.x"
```

Dependencies
------------

None as of 27/08/22

License
-------

BSD

Author Information
------------------

[Linkedin](https://www.linkedin.com/in/olivier-duchaine-664414199/)
