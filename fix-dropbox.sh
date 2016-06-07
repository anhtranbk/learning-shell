#!/bin/bash
# Argument = -r root_directory -k keyword

usage() {
cat <<EOF
Usage: $0 options

OPTIONS:
   -r      Root directory to scan
   -k      Keyword for matching files
EOF
}

delete() {
  local path=$1
  rm -rf "$path"
  [ $? -eq 0 ] && echo "Deleted" "$path"
}

ROOT=
while getopts "r:k:" OPTION; do
  case "$OPTION" in
    "r")
      ROOT=$OPTARG
      ;;
    "k")
      KEYWORD=$OPTARG
      ;;
    ":")
      echo "No argument value for option $OPTARG"
      ;;
    "?")
      echo "Unknown option $OPTARG"
      usage
      exit 1
      ;;
    *)
      usage
      exit 1
      ;;
  esac
done

if [ -z $ROOT ]; then
  usage
  exit 1
fi

array=()
for file in $(find ${ROOT} -type f -name "*${KEYWORD:-conflic}*"); do
  array=("${array[@]}" "$file")
  [ -f "$file" ] && delete "$file"
done

# array=()
# while IFS= read -d $'\0' -r file; do
#   array=("${array[@]}" "$file")
# done < <(find ${ROOT} -type f -name "*${KEYWORD:-conflic}*" -print0)

# for var in "${array[@]}"; do
#   echo "Found ${file}"
# done

echo "${#array[@]} files deleted"
exit 0
