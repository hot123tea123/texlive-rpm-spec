#!/bin/sh
#
# generate Scheme stanzas from texlive.tlpdb.orig
sed -e '/./{H;$!d;}' -e 'x;/category Scheme/!d;' texlive.tlpdb.orig > Scheme.stanza
