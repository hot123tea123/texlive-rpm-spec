#!/bin/sh
# ConTeXt list
echo "generating ConTeXt list..."
sed '/^name /!d' ConTeXt.stanza > ConTeXt.list
sed -i 's/name //' ConTeXt.list
sort ConTeXt.list -o ConTeXt.list.sort
sort -r ConTeXt.list.sort -o ConTeXt.list
# end ConTeXt list