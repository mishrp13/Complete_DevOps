
#!/bin/bash

if [ $# -eq 0 ]; then
   echo "Usage: $0 <filename>"
   exit 1
fi

file=$1

if [ ! -f "$file" ]; then
   echo "ERROR: File '$file' not found"
   exit 2
fi


echo "Name: $(basename "$file" )"
echo "Path: $(realpath "$file" )"
echo "Size: $(wc -c < "$file")bytes"
echo "Lines:$(wc -l <"$file")"
echo "Words: $(wc -w < "$file")"


[ -r "$file" ] && echo "Readable" || echo "Not Readable"
[ -w "$file" ] && echo "Writable" || echo "Not writable"
[ -x "$file" ] && echo "Executable" || echo "Not executable"

echo ""

echo "Last Modified:  $(date -r "$file" )"
