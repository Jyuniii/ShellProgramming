awk -F: '$3 >= 1000 && $3 <= 600000 {print $1, $3}' /etc/passwd
