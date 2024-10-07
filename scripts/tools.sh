#!/bin/bash

# Functions definitions
WHO() {
    who | boxes -d santa
}

DATE() {
    date
}

EXIT() {
    echo "[ FAIL ] 잘못된 만남
    exit 2
}

# Variable definitions

# Main functions
cat << EOF
====================================================
  (1). who      (2). date     (3). pwd              
====================================================
EOF

echo -n " 번호 선택? : "
read $CHOICE
echo $CHOICE

case $CHOICE in
    1) WHO  ;;
    2) DATE ;;
    3) PWD  ;;
    *) EXIT ;;

esac