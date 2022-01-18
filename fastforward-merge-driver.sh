#!/bin/env bash

current=$1
ancestor=$2
other=$3

filepath=$4

if cmp -s $ancestor $current; then
    # file hasn't changed in current branch so fast-forward
    cat $other > $current
    exit 0
else
    # cannot fast-forward because merging branch doesn't share the same history for file
    echo "CONFLICT: $filepath cannot fast-forward"
    diff -u $ancestor $current
    exit 1
fi
