#!/bin/sh
#
# split every single collection's stanza from Collection.stanza
cp -v Collection.stanza Collection.stanza.new
for clt in `cat Collection.list`; do
  echo "generating $clt..."
  sed -e '/./{H;$!d;}' -e "x;/name $clt\>/!d;" Collection.stanza.new > $clt.stanza
  sed -i -e '/./{H;$!d;}' -e "x;/name $clt\>/d;" Collection.stanza.new
done