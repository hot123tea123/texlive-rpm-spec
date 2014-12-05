#!/bin/sh
# Scheme list
echo "generating Scheme list"
sed '/^name /!d'  Scheme.stanza > Scheme.list
sed -i 's/name //' Scheme.list
sort Scheme.list -o Scheme.list.sort
sort -r Scheme.list.sort -o Scheme.list
#end Scheme list