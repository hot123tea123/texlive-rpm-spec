#!/bin/sh
#
# split every single scheme's stanza from Scheme.stanza
for tmp in `cat Scheme.list`; do
	sed -e '/./{H;$!d;}' -e "x;/name $tmp\>/!d;" Scheme.stanza > $tmp.stanza
done