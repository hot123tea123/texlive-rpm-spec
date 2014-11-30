#!/bin/sh
#
# split every single package's stanza from Package.stanza
# this step take a little long time to run the loop
#
for pkg in `cat Package.list`; do
	echo "generate $pkg.stanza..."
	sed -e '/./{H;$!d;}' -e "x;/name $pkg\>/!d;" Package.stanza > $pkg.stanza
done