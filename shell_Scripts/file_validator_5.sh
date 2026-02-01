#!/bin/bash

echo "=== File Validator ==="
echo ""

read -p "Enter filename: " file

if [[ ! -e "$file" ]]; then
   echo "File does not exist"
   exit 1
fi
echo "File exist"


if [[ -f "$file" ]]; then
   echo " Regular file "
elif [[ -d "$file" ]]; then
   echo " ! Directory (not a file)"
   exit 1
else
   echo " ! special type of file "
fi

echo ""
echo "Permission:"
[[ -r "$file" ]] && echo " Readable " || echo " Not readable "
[[ -r "$file" ]] && echo " Writable " || echo "Not writable "
[[ -x "$file" ]] && echo " Executable " || echo "Not Executable "

echo ""

if [[ -s "$file" ]]; then
   size=$(wc -c < "$file" )
   echo "File has content ($size bytes)"
else
   echo "!File is empty "
fi

echo ""

if [[ "$file" == *.txt ]]; then
   echo " Text file detected "
   lines=$(wc -l < "$file" )
   echo "Lines:$lines"
elif [[ "$file" == *.sh ]]; then
    echo "shell script detected"
    [[ -x "$file" ]] || echo "! warning : script not executable "
fi

echo ""
echo " Validation complete "

