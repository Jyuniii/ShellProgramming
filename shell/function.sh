
PkgInstall(){
    PKGLIST="$*"
    yum -q -y install $PKGLIST
    [ $? -eq 0 ] \
        && echo "[ OK ]" $PKGLIST 설치 \
        || echo "[ FAIL ]" $PKGLIST 설치
}

RandomIndex(){
    INDEXFILE="$1"
    MESSAGES="$1"
    FILE1=/root/shell/boxlist
    MAX=$(wc -l < $FILE1) #MAC=72

    RANDNUM=$(($RANDOM% $MAX+1))
    
    BOXSTR=$(sed -n "${RANDNUM}p" "$FILE1")
    cat << EOF > $INDEXFILE
<pre>
$(echo "$MESSAGES" | boxes -d "$BOXSTR")
</pre>
EOF
}

ServiceStart(){
    SVC="$1"
    systemctl restart "$SVC" >/dev/null 2>&1
    RET=$(systemctl is-active "$SVC")
    if [ "$RET" = 'active' ]; then
        echo "[ OK ] 정상적으로 $SVC 서비스가 실행되었습니다"
        systemctl enable "$SVC" > /dev/null 2>&1
    else
        echo "[FAIL] $SVC 서비스가 실행되지 않았습니다."
    fi
    systemctl enable "$SVC" >/dev/null 2>&1
    
}

FWRule(){
    RULES="$*"
    FWCMD='firewall-cmd --permanent'
    for i in $RULES
    do
        FWCMD="$FWCMD --add-service=${i}"
    done
    $FWCMD
    firewall-cmd --reload
    echo "[OK] $* 방화벽에 등록되었습니다."
}