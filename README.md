Some commands

```shell
pactl list | grep -Pzo '.*bluez_card(.*\n)*'

ansible-playbook -i inventories/main.yml playbooks/rpi.yml
ansible-playbook -i inventories/main.yml playbooks/rpi.yml --limit tv_pi --tags common
ansible-playbook -i inventories/main.yml playbooks/rpi_update.yml
ansible -i inventories/main.yml tv_pi -m  include_role -a "name=bluetooth" -b
```