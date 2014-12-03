#!/bin/sh
#
# split every single package's stanza from Package.stanza
# this step take a little long time to run the loop
#
cp -v Package.stanza Package.stanza.new
for pkg in `cat Package.list`; do
	echo "generate $pkg.stanza..."
	sed -e '/./{H;$!d;}' -e "x;/name $pkg/!d;" Package.stanza.new > $pkg.stanza
	sed -i -e '/./{H;$!d;}' -e "x;/name $pkg/d;" Package.stanza.new
done