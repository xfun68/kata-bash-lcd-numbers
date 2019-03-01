#!/bin/bash

read size

while read id
do
    [ -f /tmp/lcd-numbers/`printf '%03d' $id`.lcd.scaled ] || echo "Error: missing file for ${id}th digit!" >&2
done

paste -d' ' /tmp/lcd-numbers/*.lcd.scaled

