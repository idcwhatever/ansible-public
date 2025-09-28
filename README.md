Setting bluetooth latency:

```shell
pactl list | grep -Pzo '.*bluez_card(.*\n)*'
pactl set-port-latency-offset bluez_card.C8_BD_4D_3E_CE_50 phone-input 50000
```