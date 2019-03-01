#!/bin/bash

size=${1:-1}

function scale
{
    local lines="$1"
    local line_number=$2
    local line=`echo -e "$lines" | sed -n "${line_number}p"`

    IFS=%
    local scaled_line=$(printf "%.0s${line:0:1}" 1 && printf "%.0s${line:1:1}" `seq -s '%' $size` && printf "%.0s${line:2:1}" 1)
    unset IFS

    (( times=(($line_number - 1) % 2) * $size + ($line_number % 2) ))
    printf "%.0s${scaled_line}\n" `seq $times`
}

while read id; do
    lcd_file="/tmp/lcd-numbers/$(printf '%03d' $id).lcd"
    lines=`cat $lcd_file`
    :> $lcd_file

    for ln in `seq 5`; do
        scale "$lines" $ln >> $lcd_file
    done

    echo $id
done

