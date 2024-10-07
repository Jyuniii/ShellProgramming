#!/bin/bash

Error(){
    echo "[ FAIL ] : 잘못된 입력함 "
    exit 2
}

echo -n "Enter A: "
read A

echo -n "OP: "
read OP

echo -n "Enter C: "
read C

case $OP in
    '+') echo "$A + $C = $(expr $A + $C)" ;;
    '-') echo "$A - $C = $(expr $A - $C)" ;;
    '*') echo "$A * $C = $(expr $A \* $C)";;
    '/') echo "$A / $C = $(expr $A / $C)" ;;
    *)  Error : ;;

esac


