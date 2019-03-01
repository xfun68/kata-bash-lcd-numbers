#!/bin/bash

mkdir -p /tmp/lcd-numbers && rm -rf /tmp/lcd-numbers/*

(( id = 1 ))

for digit in `echo $1 | sed 's/./ &/g'`; do
    cp `dirname "$0"`/templates/${digit}.lcd /tmp/lcd-numbers/`printf '%03d' $id`.lcd
    echo $id
    (( id++ ))
done

