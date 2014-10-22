#!/bin/sh
#
# this step take a little long time to run the loop,
# so, I write it here
# split packages' stanza from Package.stanza
for pkg in `cat Package.list`; do
	echo "generate $pkg.stanza..."
	sed -e '/./{H;$!d;}' -e "x;/name $pkg/!d;" Package.stanza > $pkg.stanza
done