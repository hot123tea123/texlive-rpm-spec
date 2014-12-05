#!/bin/sh
#
# split every single TLCore's stanza from TLCore.stanza
#
for tmp in `cat TLCore.list`; do
	echo "generating $tmp.stanza..."
	sed -e '/./{H;$!d;}' -e "x;/name \<$tmp\>/!d;" TLCore.stanza > $tmp.stanza
done