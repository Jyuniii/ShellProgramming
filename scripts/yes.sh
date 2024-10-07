#!/bin/bash

# Function definitions
YES() {
    echo
    echo "YES" | boxes -d critical
}

NO() {
    echo "NO" | boxes -d critical
}

FAIL() {
    echo "[ FAIL ] 잘못된 만남2"
    exit 2
}

# Varible definitions

# Main function

echo -n "행님~~선택하십쇼~(y/n): "
read CHOICE

case $CHOICE in
    y|Y|yes|YES|Yes) YES  ;;
    n|N|no|NO|No)    NO   ;;
    *)               FAIL ;;
esac