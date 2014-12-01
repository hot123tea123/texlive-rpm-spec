#!/bin/sh
# ConTeXt list
echo "generate ConTeXt list..."
sed '/^name /!d' ConTeXt.stanza > ConTeXt.list
sed -i 's/name //' ConTeXt.list
# end ConTeXt list