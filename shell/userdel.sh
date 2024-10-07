#!/bin/bash

USERLIST=/root/shell/user.list

cat $USERLIST | while read UNAME UPASS
do
    userdel -r $UNAME
    [ $? -eq 0 ] \
        && echo " [ OK ] 사용자 삭제 완료" \
        || echo " [ FAIL ] 사용자 삭제 에러"
done