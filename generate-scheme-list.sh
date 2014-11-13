#!/bin/sh
# Scheme list
echo "generate Scheme list"
sed '/^name /!d'  Scheme.stanza > Scheme.list
sed -i 's/name //' Scheme.list
#end Scheme list