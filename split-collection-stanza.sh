#!/bin/sh
#
# split every single collection's stanza from Collection.stanza
for clt in `cat Collection.list`; do
	sed -e '/./{H;$!d;}' -e "x;/name $clt\>/!d;" Collection.stanza > $clt.stanza
done