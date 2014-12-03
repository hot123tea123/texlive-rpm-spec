#!/bin/sh
# ConTeXt list
echo "generate ConTeXt list..."
sed '/^name /!d' ConTeXt.stanza > ConTeXt.list
sed -i 's/name //' ConTeXt.list
sort ConTeXt.list > ConTeXt.list.sort
sort -r ConTeXt.list.sort > ConTeXt.list
# end ConTeXt list