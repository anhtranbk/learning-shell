read -p "Enter file to delete: " file
[ -f $file ] && cp -v $file /tmp/$file || echo "$0: $file not found."
