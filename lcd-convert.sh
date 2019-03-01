#!/bin/bash

mkdir -p /tmp/lcd-numbers && rm -rf /tmp/lcd-numbers/*

size=1
if [[ $# -ge 2 ]]; then
    size=$1
    shift
fi

echo $size

(( id = 1 ))

for digit in `echo $1 | sed 's/./ &/g'`
do
    cp /tmp/${digit}.lcd /tmp/lcd-numbers/`printf '%03d' $id`.lcd
    echo $id
    (( id++ ))
done

