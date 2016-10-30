# ansible-config-webservers

Sample Ansible configuration to provision PHP and Ruby enabled web servers.

Can be tested with (or be used to test) my [`ansible-vagrant-playground` settings](https://github.com/gael-ian/ansible-vagrant-playground).

## Installation

Some Ansible roles used in these settings come from [Ansible Galaxy](https://galaxy.ansible.com/).
To install these roles, run:

    ansible-galaxy install -r roles-requirements.yml -p ./roles/externals/

## Configurations

Configurations are dispatched in the playbooks availables at the repository's root.
These playbooks should be applied sequentialy for servers first setup.
They after can be used independantly to apply later modifications.

Comments on top of each playbook provide details on usage.
Comments in the `roles` section of each playbook provide details on applied configurations.


# TODO

* Un pool PHP par application et par environnement (chroot ?)
* Stabilisation de la configuration nginx
* Unification des logs d'une application dans un répertoire unique :
    - Application
    - Interpréteur (Ruby + Passenger / PHP + PHP-FPM)
    - Serveur web
    - Crons
    (- DB ?)
* Un utilisateur par application
