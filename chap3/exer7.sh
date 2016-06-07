read -p "Enter domain name: " hostname
getent hosts ${hostname:?Hostname invalid} | awk '{ print $1 }'
