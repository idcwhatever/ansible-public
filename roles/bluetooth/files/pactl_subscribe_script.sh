#!/bin/bash

pactl subscribe | while read x event y type num; do
    # echo "Event $event type $type, num $num"

    if [ $event == "'new'" -a $type == "source" ]; then
        source_number=$(echo "$num" | tr --delete "#")
        bluez_source=$(pactl list short sources | grep -P "$source_number\tbluez_source" || echo "false")

        if [[ "$bluez_source" != "false" ]]
        then
            echo "Loading loopback module for source $num"
            pactl load-module module-loopback latency_msec=1000 source="$source_number" sink=$(pactl get-default-sink)
        fi
    fi

    if [ $event == "'new'" -a $type == "card" ]; then
        card_number=$(echo "$num" | tr --delete "#")
        bluez_card=$(pactl list short cards | grep -P "$card_number\tbluez_card" || echo "false")

        if [[ "$bluez_card" != "false" ]]
        then
            echo "Setting profile 'a2dp_source' for card $num"
            pactl set-card-profile "$card_number" a2dp_source
        fi
    fi
done