#!/bin/sh
#
# split every single collection's stanza from Collection.stanza
for clt in `cat Collection.list`; do
  echo "generating $clt..."
  sed -e '/./{H;$!d;}' -e "x;/name \<$clt\>/!d;" Collection.stanza > $clt.stanza
done