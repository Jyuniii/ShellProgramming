#!/bin/bash
######################
# 1. $HOME/.bashrc
# 2. $HOME/.vimrc
# 3.
######################
sed -e 
source /root/shell/function.sh

echo "[$HOME/.bashrc]"
##############################
# 1. $HOME/.bashrc
#
##############################
BASHRC=$HOME/bashrc.txt
echo "Phase 01 $BASHRC 파일 설정"
/bin/cp /etc/skel/.bashrc $BASHRC

cat << EOF >> $BASHRC
#
# Specific configuration
#
export PS1='\[\e[31;1m\][\w]\$ \[\e[m\]'

alias ls='ls -h -F --color=auto'
alias tree='env LANG=C tree -F'
alias c='clear'
alias pps='ps -ef | head -1 ; ps -ef | grep $1 | grep -vw grep | grep -vw ps    '
alias grep='grep --color=auto'
alias vi='/usr/bin/vim'
alias df='df -h -T'

EOF
echo "[OK] $BASHRC 설정 완료"