#!/bin/bash

while read id
do
    [ -f /tmp/lcd-numbers/`printf '%03d' $id`.lcd ] || echo "Error: missing file for ${id}th digit!" >&2
done

paste -d' ' /tmp/lcd-numbers/*.lcd

