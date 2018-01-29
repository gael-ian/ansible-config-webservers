# ansible-config-webservers

Ansible configuration to provision PHP and Ruby enabled web servers.

Can be tested with (or be used to test) [`ansible-vagrant-playground` settings](https://github.com/gael-ian/ansible-vagrant-playground).

## Configurations

Configurations are dispatched in the playbooks availables at the repository's root.
The 3 main playbooks (`0_.0--*.yml`) should be applied sequentialy for the first setup.
Any playbook can later be used independantly to apply modifications.

Comments on top of each playbook provide details on usage.
Comments in the `roles` section of each playbook provide details on applied configurations.

### Ansible Vault

Ansible Vault is used to store sensible information : user account passwords, SSH keys and database passwords.

**Note:**
This repo aims to be usable out of the box to discover Ansible. Thus, Ansible Vault password and SSH keys have been keeped in the repository, respectevely in the `.vaultpass` file and in the `.keys` directory.
If you want to use this repo as a base for your own configuration, ensure you remove these files from versioning.
