Some commands

```shell
pactl list | grep -Pzo '.*bluez_card(.*\n)*'

ansible-playbook -i inventories/main.yml playbooks/rpi.yml --become
ansible-playbook -i inventories/main.yml playbooks/rpi.yml --limit tv_pi --tags common --become
ansible-playbook -i inventories/main.yml playbooks/rpi_update.yml --become
ansible -i inventories/main.yml tv_pi -m  include_role -a "name=bluetooth" --become
```