#!/bin/sh
#
# split every single ConTeXt's stanza from ConTeXt.stanza
# this step take a little long time to run the loop
#
cp -v ConTeXt.stanza ConTeXt.stanza.new
for tmp in `cat ConTeXt.list`; do
	echo "generate $tmp.stanza..."
	sed -e '/./{H;$!d;}' -e "x;/name $tmp\>/!d;" ConTeXt.stanza.new > $tmp.stanza
	sed -i -e '/./{H;$!d;}' -e "x;/name $tmp\>/d;" ConTeXt.stanza.new
done